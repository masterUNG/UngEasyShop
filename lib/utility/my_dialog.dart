import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_logo.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class MyDialog {
  Future<void> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowLogo(),
          title: ShowText(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(title: message),
        ),actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }
}
