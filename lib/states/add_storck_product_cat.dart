import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungeasyshop/models/stock_model.dart';
import 'package:ungeasyshop/utility/my_constant.dart';

class AddStockProductCat extends StatefulWidget {
  const AddStockProductCat({Key? key}) : super(key: key);

  @override
  _AddStockProductCatState createState() => _AddStockProductCatState();
}

class _AddStockProductCatState extends State<AddStockProductCat> {
  final formKey = GlobalKey<FormState>();
  TextEditingController groupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: Text('เพิ่มกลุ่มของสินค้า'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildGroup(),
              buildAddGroup(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildAddGroup() {
    return Container(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            checkOrAddGroup();
          }
        },
        child: Text('Add Group'),
      ),
    );
  }

  Future<void> checkOrAddGroup() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(event!.uid)
          .collection('stock')
          .get()
          .then((value) {
        if (value.docs.isEmpty) {
          processAddGroup(event.uid);
        } else {
          // ตรวจว่า Group ซ้ำ
          processAddGroup(event.uid);
        }
      });
    });
  }

  Future<void> processAddGroup(String docId) async {
    StockModel model = StockModel(cat: groupController.text);
    await FirebaseFirestore.instance
        .collection('user')
        .doc(docId)
        .collection('stock')
        .doc()
        .set(model.toMap())
        .then((value) => Navigator.pop(context));
  }

  Container buildGroup() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: TextFormField(
        controller: groupController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาเพิ่ม ชื่อกลุ่มด้วย คะ';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          label: Text('เพิ่มกลุ่มของสินค้า'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
