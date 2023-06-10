// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, non_constant_identifier_names, unused_local_variable, must_be_immutable, unnecessary_null_comparison

import 'dart:convert';

import 'package:aaravchatapp/mainPages/homepage.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class chatscreen extends StatefulWidget {
  final String name;
  final String emoji;

  const chatscreen({super.key, required this.name, required this.emoji});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  //creating the objects of UserModel (target user to whom we are talking with)
  TextEditingController messageController = TextEditingController();

  // ----------------------------------------------------------------------//

  List<String> messages = [];

  void _sendMessage() async {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
      });

      messageController.clear();

      SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.setString('messages', jsonEncode(messages));
    }
  }

  void loadMessages() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String loadedmessages = jsonDecode('messages');
    if (loadedmessages != null) {
      setState(() {
        messages = jsonDecode('messages').cast<String>();
      });
    }
  }

  // ----------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.amber.shade900,
              size: 32,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Under Development"),
                        );
                      });
                },
                icon: Icon(FluentIcons.call_16_regular)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Under Development"),
                        );
                      });
                },
                icon: Icon(FluentIcons.meet_now_16_regular)),
          ],
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 24,
                child: Text(
                  widget.emoji,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(widget.name,style: TextStyle(fontSize: 20),),
                  Text('⏳ Disappering Messages ON',style: TextStyle(fontSize: 10),),
                ],
              ),
             
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(),
            ),
            Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 10),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.purple, Colors.pink],
                              ),
                              // color: (index % 2 == 0)
                              //     ? Colors.redAccent
                              //     : Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            trailing: Text(
                              messages[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    })),
            //text field and send button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: messageController,
                        //for removing "Enter as a send key"
                        maxLines: null,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[500],
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusColor: Colors.red[100],
                            hintText: 'Type your message',
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                    MaterialButton(
                      elevation: 1,
                      onPressed: () {
                        _sendMessage();
                      },
                      color: Colors.orange,
                      height: 60,
                      shape: CircleBorder(
                        side: BorderSide.none,
                      ),
                      child: Icon(Icons.send_rounded),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
