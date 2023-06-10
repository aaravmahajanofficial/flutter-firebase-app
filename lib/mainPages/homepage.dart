// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, unused_local_variable

import 'package:aaravchatapp/extras/chaticons.dart';
import 'package:aaravchatapp/extras/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../extras/profile.dart';

final List chaticons_emoji = [
  '🤖',
  '🦊',
  '🐰',
  '🐻',
  '🐧',
  '🐬',
  '🦏',
  '🐶',
  '🦄',
  '🐧',
  '🐬',
  '🦏',
  '🐶',
  '🏦',
];

final List chaticons_more = [
  '🍿',
  '🥳',
  '😎',
  '🐧',
  '🐬',
  '😍',
  '🤑',
  '🤠',
  '😇',
  '😵‍💫',
  '🤯',
  '😼',
  '🐼',
];
final List contacts = [
  'Ask CHATGPT',
  'Alex Johnson',
  'Joe Jonas',
  'Maya',
  'ChainSmokers',
  'Doja',
  'Sam',
  'Andrew Jo',
  'Tom',
  'Dua',
  'Selena',
  'Weeknd',
  'Halsey',
  'MorganStanley'
];
final List contacts_more = [
  'Rock',
  'Olivia',
  'James',
  'ShinChan',
  'Benjamin',
  'Sam',
  'Andrew Jo',
  'Isabella M',
  'Dua',
  'Selena',
  'Weeknd',
  'Halsey',
  'MorganStanley'
];

final List messages = [
  '⏳ Coming Soon...',
  '🏖️ Made with 💖 by Aarav Mahajan',
  '🏫 1COE-2 (102203020)',
  '🕺 Dancing',
  '🥳 Keep it Simple',
  '😀 Smile...',
  '🐶 evening walk with browny',
  '👻 Send me the documents 🗃️',
  '🥱 sleeping...call in the evening',
  "🍿 lets go for a movie..I have two tickets 🎟️",
  '👋 Bye',
  '📈 Check the latest stock...',
  '✈️ Off to Canada...',
  '💸 Your Last Transaction was',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  Future getDetails() async {
    if (currentUser != null) {
      for (final providerProfile in currentUser.providerData) {
        // ID of the provider (google.com, apple.cpm, etc.)
        final provider = providerProfile.providerId;

        // UID specific to the provider
        final uid = providerProfile.uid;

        // Name, email address, and profile photo URL
        final name = providerProfile.displayName;
        final emailAddress = providerProfile.email;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("😁 EmojiFI 😻",
              style: GoogleFonts.bayon(
                fontSize: 34,
              )),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: GNav(
                selectedIndex: 0,
                tabBorderRadius: 25,
                curve: Curves.easeInExpo,
                backgroundColor: Colors.grey.shade100,
                color: Colors.black,
                activeColor: Colors.black,
                gap: 10,
                padding: const EdgeInsets.all(20),
                haptic: true,
                duration: const Duration(milliseconds: 400),
                tabs: [
                  GButton(
                    icon: FluentIcons.home_16_regular,
                    text: "Home",
                    iconActiveColor: Colors.purple.withOpacity(0.8),
                    textColor: Colors.purple,
                    backgroundColor: Colors.purple.shade100.withOpacity(0.8),
                    rippleColor: Colors.purple.withOpacity(0.8),
                  ),
                  GButton(
                    icon: FluentIcons.call_16_regular,
                    text: "Call",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('Feature Under Development'),
                            );
                          });
                    },
                    iconActiveColor: Colors.green.withOpacity(0.8),
                    textColor: Colors.green,
                    backgroundColor: Colors.green.shade100.withOpacity(0.8),
                    rippleColor: Colors.green.withOpacity(0.8),
                  ),
                  GButton(
                    icon: FluentIcons.camera_sparkles_16_regular,
                    text: "Camera",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('Feature Under Development'),
                            );
                          });
                    },
                    iconActiveColor: Colors.orange.withOpacity(0.8),
                    textColor: Colors.orange,
                    backgroundColor: Colors.yellow.shade100.withOpacity(0.8),
                    rippleColor: Colors.orange.withOpacity(0.8),
                  ),
                  GButton(
                    icon: FluentIcons.person_16_regular,
                    text: "Profile",
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile())),
                    iconActiveColor: Colors.cyan.withOpacity(0.8),
                    textColor: Colors.cyan,
                    backgroundColor: Colors.cyan.withOpacity(0.4),
                    rippleColor: Colors.cyan.withOpacity(0.8),
                  ),
                ]),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text("😃 Hi ${currentUser.displayName!},",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //stories
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: chaticons_more.length,
                      itemBuilder: ((context, index) {
                        return Chaticons(
                            emoji: chaticons_more[index],
                            name: contacts_more[index]);
                      }))),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(),
              ),

              //recent chats
              Expanded(
                  flex: 4,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: chaticons_emoji.length,
                      itemBuilder: ((context, index) {
                        return Messages(
                            name: contacts[index],
                            emoji: chaticons_emoji[index],
                            messages: messages[index]);
                      })))
            ],
          ),
        ));
  }
}
