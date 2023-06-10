// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, body_might_complete_normally_nullable, unused_import, avoid_function_literals_in_foreach_calls, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:aaravchatapp/extras/verification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10.0),
            child: Text("We're sorry to see you go :(",style: TextStyle(fontSize: 36),),
          )),

          Expanded(child: Text('😿',style: TextStyle(fontSize: 64),)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Verify_LoginIN();
                }));
              },
              color: Colors.red.shade700.withOpacity(0.8),
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Signed in as : ' + currentUser.email!),
          ),
          
        ],
      )),
    );
  }
}
