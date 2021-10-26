import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungeasyshop/states/authen.dart';
import 'package:ungeasyshop/states/create_account.dart';
import 'package:ungeasyshop/states/service_buyer.dart';
import 'package:ungeasyshop/states/service_shopper.dart';
import 'package:ungeasyshop/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  MyConstant.routeAuthen: (BuildContext context) => const Authen(),
  MyConstant.routeCreateAccount: (BuildContext context) =>
      const CreateAccount(),
  MyConstant.routeServiceBuyer: (BuildContext context) => const ServiceBuyer(),
  MyConstant.routeServerShopper: (BuildContext context) =>
      const ServiceShopper(),
};

String? firstState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    print('Initial Success');
    firstState = MyConstant.routeAuthen;
    runApp(const MyApp());
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
