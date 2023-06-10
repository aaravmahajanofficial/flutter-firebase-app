// ignore_for_file: use_build_context_synchronously

import 'package:aaravchatapp/extras/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../extras/forgot_password.dart';
import '../extras/new_user_register.dart';
import '../extras/signinbutton.dart';
import '../extras/squaretiles.dart';
import '../extras/textfields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//signIn logic
  Future signuserin() async {
    try {
      //circularProgressIndicator
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.of(context).pop();
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

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            //! tip for responsive design
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Made with 💖 by Aarav Mahajan, 102203020'),
              const SizedBox(
                height: 18,
              ),
              const Icon(
                FluentIcons.animal_dog_20_regular,
                size: 120,
              ),
              const SizedBox(
                height: 40,
              ),

              //greetings
              const Text(
                "Welcome Back you've been missed!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(
                height: 25,
              ),

              //userfields
              //email

              Chat_Fields(
                userInput: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),

              const SizedBox(
                height: 10,
              ),
              //password
              Chat_Fields(
                userInput: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),

              //forgot Password?
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ForgotPagePage();
                        }));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //signIn Button
              SignInButton(
                text: 'Sign In',
                onTap: () {
                  signuserin();
                },
              ),

              //or continue with

              const SizedBox(
                height: 48,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.grey[400],
                      thickness: 0.5,
                    )),
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.grey[400],
                      thickness: 0.5,
                    )),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //Sign-In with

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()=> AuthService().signInWithGoogle(),
                      child: const SquareTile(ImagePath: 'lib/icons/google.png')),
                ],
              ),

              const SizedBox(
                height: 36,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const new_user_register();
                      }));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
