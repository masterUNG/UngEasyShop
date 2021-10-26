import 'package:flutter/material.dart';

class EditShopProfile extends StatefulWidget {
  const EditShopProfile({ Key? key }) : super(key: key);

  @override
  _EditShopProfileState createState() => _EditShopProfileState();
}

class _EditShopProfileState extends State<EditShopProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('แก้ไขข้อมูลร้านค้า'),),
    );
  }
}