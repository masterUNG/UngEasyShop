import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungeasyshop/models/stock_model.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_process.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class StockProductCatigory extends StatefulWidget {
  const StockProductCatigory({Key? key}) : super(key: key);

  @override
  _StockProductCatigoryState createState() => _StockProductCatigoryState();
}

class _StockProductCatigoryState extends State<StockProductCatigory> {
  bool load = true;
  bool? haveStock;
  List<StockModel> stockModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readStock();
  }

  Future<void> readStock() async {
    if (stockModels.isNotEmpty) {
      stockModels.clear();
    }

    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String uid = event!.uid;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('stock')
          .get()
          .then((value) {
        print('## value Strock = ${value.docs.length}');

        if (value.docs.isEmpty) {
          setState(() {
            haveStock = false;
            load = false;
          });
        } else {
          for (var item in value.docs) {
            StockModel model = StockModel.fromMap(item.data());
            setState(() {
              stockModels.add(model);
              haveStock = true;
              load = false;
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
                context, MyConstant.routeAddStockProductCat).then((value) => readStock()),
            icon: Icon(Icons.add_box),
          ),
        ],
        backgroundColor: MyConstant.primary,
        title: Text('คลังสินค้า (กลุ่มของสินค้า)'),
      ),
      body: load
          ? ShowProcess()
          : haveStock!
              ? ListView.builder(itemCount: stockModels.length,
                  itemBuilder: (context, index) => ShowText(
                    title: stockModels[index].cat,
                    textStyle: MyConstant().h2Style(),
                  ),
                )
              : Center(
                  child: ShowText(
                    title: 'ยังไม่มี กลุ่มสินค้า',
                    textStyle: MyConstant().h1Style(),
                  ),
                ),
    );
  }
}
