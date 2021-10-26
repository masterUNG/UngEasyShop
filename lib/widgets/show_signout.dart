import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungeasyshop/utility/my_constant.dart';
import 'package:ungeasyshop/widgets/show_logo.dart';
import 'package:ungeasyshop/widgets/show_text.dart';

class ShowSignOut extends StatelessWidget {
  const ShowSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: ListTile(
              leading: ShowLogo(),
              title: ShowText(
                title: 'คุณต้องการจะ SignOut ?',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, MyConstant.routeAuthen, (route) => false));
                },
                child: const Text('Sign Out'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.exit_to_app),
    );
  }
}
