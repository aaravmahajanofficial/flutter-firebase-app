// ignore_for_file: unused_import

import 'package:aaravchatapp/extras/verification.dart';
import 'package:aaravchatapp/mainPages/homepage.dart';
import 'package:aaravchatapp/mainPages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light,),
      debugShowCheckedModeBanner: false,
      home: const Verify_LoginIN(),
    );
  }
}
