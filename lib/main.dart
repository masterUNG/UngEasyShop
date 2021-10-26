import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungeasyshop/models/user_model.dart';
import 'package:ungeasyshop/states/add_storck_product_cat.dart';
import 'package:ungeasyshop/states/authen.dart';
import 'package:ungeasyshop/states/create_account.dart';
import 'package:ungeasyshop/states/edit_shop_profile.dart';
import 'package:ungeasyshop/states/forgotpassword.dart';
import 'package:ungeasyshop/states/service_buyer.dart';
import 'package:ungeasyshop/states/service_shopper.dart';
import 'package:ungeasyshop/states/stock_product.dart';
import 'package:ungeasyshop/states/stock_product_catigory.dart';
import 'package:ungeasyshop/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  MyConstant.routeAuthen: (BuildContext context) => const Authen(),
  MyConstant.routeCreateAccount: (BuildContext context) =>
      const CreateAccount(),
  MyConstant.routeServiceBuyer: (BuildContext context) => const ServiceBuyer(),
  MyConstant.routeServerShopper: (BuildContext context) =>
      const ServiceShopper(),
  MyConstant.routeForgotPassword: (BuildContext context) =>
      const ForgotPassword(),
  MyConstant.routeStockProduct: (BuildContext context) => const StockProduct(),
  MyConstant.routeEditShopProfile: (BuildContext context) =>
      const EditShopProfile(),
  MyConstant.routeStockProductCatigory: (BuildContext context) =>
      const StockProductCatigory(),
  MyConstant.routeAddStockProductCat: (BuildContext context) =>
      const AddStockProductCat(),
};

String? firstState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    print('Initial Success');

    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .get()
            .then((value) {
          UserModel model = UserModel.fromMap(value.data()!);
          switch (model.typeuser) {
            case 'buyer':
              firstState = MyConstant.routeServiceBuyer;
              runApp(const MyApp());
              break;
            case 'shopper':
              firstState = MyConstant.routeServerShopper;
              runApp(const MyApp());
              break;
            default:
          }
        });
      } else {
        firstState = MyConstant.routeAuthen;
        runApp(const MyApp());
      }
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: firstState,
    );
  }
}
