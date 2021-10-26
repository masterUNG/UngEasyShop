import 'package:flutter/material.dart';

class MyConstant {
  //field
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeServiceBuyer = '/serviceBuyer';
  static String routeServerShopper = '/serviceShopper';
  static String routeForgotPassword = '/forgotPassword';
  static String routeStockProduct = '/stockProduct';
  static String routeEditShopProfile = '/editShopProfile';
  static String routeStockProductCatigory = '/stockProductCatigory';
  static String routeAddStockProductCat = '/addStockProductCat';

  static Color primary = const Color(0xff2c3baa);
  static Color dark = const Color(0xff00157a);
  static Color light = const Color(0xff6665dd);

  //method

  BoxDecoration simpleBox() => BoxDecoration(color: light);

  BoxDecoration gradianBox() => BoxDecoration(
        gradient: RadialGradient(radius: 1.0,
          colors: [Colors.white, light],
        ),
      );

  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );

  TextStyle h1Style() => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: dark,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: dark,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: dark,
      );
}
