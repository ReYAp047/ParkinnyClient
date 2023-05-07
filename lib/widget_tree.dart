import 'package:parkinny/auth.dart';
import 'package:parkinny/screen/order_traking_page.dart';
import 'package:parkinny/bottom_Navigation.dart';
import 'package:parkinny/screen/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          GlobalVariables.clientEmail = snapshot.data?.email ?? '';
         // return OrderTrackingPage();
          return bottom_Navigation();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}