import 'package:chat_test/Screens/ChatPage.dart';
import 'package:chat_test/Screens/Loginpage.dart';
import 'package:chat_test/Screens/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(chat_test());
}

class chat_test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Chatpage.chatid: (context) => Chatpage(),
        Registerpage.registerId: (context) => Registerpage(),
      },
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
