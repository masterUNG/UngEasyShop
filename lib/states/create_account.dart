import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/utility/my_dialog.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Container buildCreateAccount() {
    return Container(
      width: 250,
      child: ElevatedButton(
        style: MyConstant().myButtonStyle(),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (typeUser == null) {
              MyDialog().normalDialog(
                  context, 'ไม่มีชนิดผู้ใช้งาน', 'โปรดเลือก ชนิดของผู้ใช้งาน');
            } else {
              processRegisterAndInsertUser();
            }
          }
        },
        child: Text('สร้างบัญชีใหม่'),
      ),
    );
  }

  Future<void> processRegisterAndInsertUser() async {}

  Container buildName() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 250,
      child: TextFormField(controller: nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอก ชือผู้ใช้งาน ด้วยคะ ?';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.fingerprint),
          label: ShowText(
            title: 'ชื่อผู้ใช้งาน :',
            textStyle: MyConstant().h2Style(),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: TextFormField(controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอก Email ผู้ใช้งาน ด้วยคะ ?';
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
      margin: EdgeInsets.only(bottom: 16),
      width: 250,
      child: TextFormField(controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอก รหัสผ่าน ด้วยคะ ?';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_clock_outlined),
          label: ShowText(
            title: 'รหัสผ่าน :',
            textStyle: MyConstant().h2Style(),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างบัญชีใหม่'),
        backgroundColor: MyConstant.primary,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    buildName(),
                    buildTitle(),
                    buildType(),
                    buildEmail(),
                    buildPassword(),
                    buildCreateAccount(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildType() {
    return Container(
      width: 300,
      child: Row(
        children: [
          Container(
            width: 150,
            child: RadioListTile(
              title: ShowText(title: 'ลูกค้า'),
              value: 'buyer',
              groupValue: typeUser,
              onChanged: (value) {
                setState(() {
                  typeUser = value.toString();
                });
              },
            ),
          ),
          Container(
            width: 150,
            child: RadioListTile(
              title: ShowText(title: 'เจ้าของร้าน'),
              value: 'shopper',
              groupValue: typeUser,
              onChanged: (value) {
                setState(() {
                  typeUser = value.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: Row(
        children: [
          ShowText(
            title: 'ชนิดของผู้ใช้งาน :',
            textStyle: MyConstant().h2Style(),
          ),
        ],
      ),
    );
  }
}
