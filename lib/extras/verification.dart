// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../mainPages/homepage.dart';
import '../mainPages/loginpage.dart';

class Verify_LoginIN extends StatelessWidget {
  const Verify_LoginIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //snapshot gives the info of the user
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
