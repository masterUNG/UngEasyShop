import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class StockProduct extends StatefulWidget {
  const StockProduct({Key? key}) : super(key: key);

  @override
  _StockProductState createState() => _StockProductState();
}

class _StockProductState extends State<StockProduct> {
  List<String> titles = [
    'คลังสินค้า',
    'สินค้าใกล้หมดอายุ',
    'สินค้าค้างสต้อค',
    'สินค้าขายดี',
  ];

  List<String> routeProducts = [
    MyConstant.routeStockProductCatigory,
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('การสต้อคสินค้า'),
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
