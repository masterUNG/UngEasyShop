import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyConstant.primary,
        title: const Text('ลืมรหัสผ่าน'),
      ),
    );
  }
}
