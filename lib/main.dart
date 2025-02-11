import 'package:chatter_box_flutter/auth/login_or_register.dart';
import 'package:chatter_box_flutter/pages/login_page.dart';
import 'package:chatter_box_flutter/pages/register_page.dart';
import 'package:chatter_box_flutter/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatterBox',
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}
