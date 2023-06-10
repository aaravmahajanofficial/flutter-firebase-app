// ignore_for_file: must_be_immutable

import 'package:aaravchatapp/extras/chat_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class Messages extends StatelessWidget {
  const Messages(
      {super.key,
      required this.name,
      required this.emoji,
      required this.messages});
  final String emoji;
  final String messages;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          //*quick actions 👇
          child: Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(12),
                  onPressed: ((context) {}),
                  backgroundColor: Colors.green.withOpacity(0.8),
                  icon: FluentIcons.archive_16_filled,
                  label: "Archive",
                ),
                SlidableAction(
                  borderRadius: BorderRadius.circular(12),
                  onPressed: ((context) {}),
                  backgroundColor: Colors.orange.withOpacity(0.6),
                  icon: FluentIcons.mail_unread_16_filled,
                  label: "Unread",
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(12),
                  onPressed: ((context) {}),
                  backgroundColor: Colors.blue.withOpacity(0.8),
                  icon: FluentIcons.mail_read_16_filled,
                  label: "Read",
                ),
                SlidableAction(
                  borderRadius: BorderRadius.circular(12),
                  onPressed: ((context) {}),
                  backgroundColor: Colors.red.withOpacity(0.8),
                  icon: FluentIcons.delete_16_filled,
                  label: "Delete",
                ),
              ],
            ),

            //*recent messages pane
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return chatscreen(
                    name: name,
                    emoji: emoji,
                  );
                }));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    //providing the testpage
                    Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  width: double.infinity,
                  height: 100,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.lightBlue.shade100.withOpacity(0.4),
                      radius: 40,
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    title: Text(
                      name,
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      messages,
                      style: GoogleFonts.roboto(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
