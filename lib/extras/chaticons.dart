

import 'package:aaravchatapp/extras/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chaticons extends StatelessWidget {
  const Chaticons({super.key, required this.emoji, required this.name});

//create the strings
  final String emoji;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return chatscreen(name: name, emoji: emoji);
              }));
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red,),
                  color: const Color.fromARGB(255, 222, 239, 248)),
              padding: const EdgeInsets.all(8),
              child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 36))),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          //name
          Text(
            name,
            style:
                GoogleFonts.notoSans(fontWeight: FontWeight.w600, fontSize: 12),
          )
        ],
      ),
    );
  }
}
