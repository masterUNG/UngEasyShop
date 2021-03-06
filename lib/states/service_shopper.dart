import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_signout.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class ServiceShopper extends StatefulWidget {
  const ServiceShopper({Key? key}) : super(key: key);

  @override
  _ServiceShopperState createState() => _ServiceShopperState();
}

class _ServiceShopperState extends State<ServiceShopper> {
  List<String> titles = [
    'แก้ไขข้อมุลร้านค้า',
    'การสต้อคสินค้า',
    'การจัดโปรโมชั่น',
    'ประวัติรายการ',
    'หน้าร้านค้า',
    'สถาณะสั่งซื่อ',
    'ติดต่อลูกค้า',
  ];

  List<String> routeProducts = [
    MyConstant.routeEditShopProfile,
    MyConstant.routeStockProduct,
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('ส่วนของ ร้านค้า'),
        actions: [ShowSignOut()],
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (routeProducts[index].isNotEmpty) {
              Navigator.pushNamed(context, routeProducts[index]);
            }
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowText(
                title: titles[index],
                textStyle: MyConstant().h2Style(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
