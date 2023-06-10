// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, camel_case_types, use_build_context_synchronously, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:aaravchatapp/extras/authservice.dart';
import 'package:aaravchatapp/extras/signinbutton.dart';
import 'package:aaravchatapp/extras/squaretiles.dart';
import 'package:aaravchatapp/extras/textfields.dart';
import 'package:aaravchatapp/extras/verification.dart';
import 'package:aaravchatapp/mainPages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../mainPages/loginpage.dart';

class new_user_register extends StatefulWidget {
  const new_user_register({super.key});

  @override
  State<new_user_register> createState() => _new_user_registerState();
}

class _new_user_registerState extends State<new_user_register> {
  //email controller and password controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  //function, when onTap is pressed and also add the details to the firebase
  Future signup() async {
    try {
      if (passwordCheck()) {
        //circular indicator
        showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            });

        //create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        //add details to the firebase
        addDetails(firstNameController.text.trim(),
            lastNameController.text.trim(), emailController.text.trim());

        Navigator.of(context).pop();

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Verify_LoginIN();
        }));
      }
      //show the error
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

//password check if valid or not
  bool passwordCheck() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //function for adding the details to the firebase database

  Future addDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }

  //disposing the controllers for memory management
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  //driver code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            //! tip for responsive design
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              //greetings
              Text(
                "Be a part of Emojifi 🥳 Squad!",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),

              //userfields
              //email

              Chat_Fields(
                userInput: firstNameController,
                hintText: 'First Name',
                obsecureText: false,
              ),

              const SizedBox(
                height: 3,
              ),
              Chat_Fields(
                userInput: lastNameController,
                hintText: 'Last Name',
                obsecureText: false,
              ),

              const SizedBox(
                height: 3,
              ),
              Chat_Fields(
                userInput: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),

              const SizedBox(
                height: 3,
              ),
              //password
              Chat_Fields(
                userInput: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 3,
              ),
              //password
              Chat_Fields(
                userInput: confirmpasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
              ),

              const SizedBox(
                height: 25,
              ),

              //Sign Up Button
              SignInButton(
                text: 'Sign Up',
                onTap: () {
                  signup();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
              ),
              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I am a member!',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )),
    );
  }
}
