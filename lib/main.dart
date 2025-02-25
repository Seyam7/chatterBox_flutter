import 'package:chatter_box_flutter/auth/auth_gate.dart';
import 'package:chatter_box_flutter/auth/login_or_register.dart';
import 'package:chatter_box_flutter/firebase_options.dart';
import 'package:chatter_box_flutter/pages/login_page.dart';
import 'package:chatter_box_flutter/pages/register_page.dart';
import 'package:chatter_box_flutter/themes/light_mode.dart';
import 'package:chatter_box_flutter/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatterBox',
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
