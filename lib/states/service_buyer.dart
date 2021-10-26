import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_signout.dart';

class ServiceBuyer extends StatefulWidget {
  const ServiceBuyer({Key? key}) : super(key: key);

  @override
  _ServiceBuyerState createState() => _ServiceBuyerState();
}

class _ServiceBuyerState extends State<ServiceBuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [ShowSignOut()],
        backgroundColor: MyConstant.primary,
        title: const Text('Buyer'),
      ),
    );
  }
}
