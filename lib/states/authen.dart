import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungeasyshop/models/user_model.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/utility/my_dialog.dart';
import 'package:ungeasyshop/widgets/show_logo.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyConstant().gradianBox(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildLogo(),
                  buildUser(),
                  buildPassword(),
                  buildLogin(),
                  buildForgotPassword(),
                  buildCreateAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildForgotPassword() => TextButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeForgotPassword),
        child: const Text('ลืมรหัสผ่าน'),
      );

  TextButton buildCreateAccount() => TextButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeCreateAccount),
        child: Text('สร้างบัญชีใหม่'),
      );

  Container buildLogin() {
    return Container(
      width: 250,
      child: ElevatedButton(
        style: MyConstant().myButtonStyle(),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            checkAuthen();
          }
        },
        child: Text('เข้าสู่ระบบ'),
      ),
    );
  }

  Future<void> checkAuthen() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) async {
      String uid = value.user!.uid;

      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .get()
          .then((value) {
        UserModel model = UserModel.fromMap(value.data()!);

        switch (model.typeuser) {
          case 'buyer':
            Navigator.pushNamedAndRemoveUntil(
                context, MyConstant.routeServiceBuyer, (route) => false);
            break;
             case 'shopper':
            Navigator.pushNamedAndRemoveUntil(
                context, MyConstant.routeServerShopper, (route) => false);
            break;
          default:
        }
      });
    }).catchError((value) {
      MyDialog().normalDialog(context, value.code, value.message);
    });
  }

  Container buildUser() {
    return Container(
      width: 250,
      child: TextFormField(
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอก Email ด้วย คะ';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          label: ShowText(
            title: 'Email ผู้ใช้งาน :',
            textStyle: MyConstant().h2Style(),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอก รหัสผ่าน ด้วย คะ';
          } else {
            return null;
          }
        },
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          label: ShowText(
            title: 'รหัสผ่าน :',
            textStyle: MyConstant().h2Style(),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      width: 150,
      child: ShowLogo(),
    );
  }
}
