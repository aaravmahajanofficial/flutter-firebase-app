// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Chat_Fields extends StatelessWidget {
  final userInput;
  final String hintText;
  final bool obsecureText;
  const Chat_Fields(
      {super.key,
      required this.userInput,
      required this.hintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        //
        scrollPhysics: BouncingScrollPhysics(),
        controller: userInput,
        obscureText: obsecureText,
        style: TextStyle(color: Colors.black),

        //
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          // hintText
          hintText: hintText,
          //
          hintStyle: TextStyle(color: Colors.grey[400]),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
