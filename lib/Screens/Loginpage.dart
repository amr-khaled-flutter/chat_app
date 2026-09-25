import 'package:chat_test/Screens/ChatPage.dart';
import 'package:chat_test/Screens/RegisterPage.dart';
import 'package:chat_test/const/constant.dart';
import 'package:chat_test/helper/messageUser.dart';
import 'package:chat_test/widget/CustomTextfeild.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Loginpage> {
  GlobalKey<FormState> Formkey = GlobalKey();
  String? Email;
  String? password;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kprimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Form(
            key: Formkey,
            child: Column(
              children: [
                Spacer(flex: 1),
                Image(image: AssetImage('assets/images/scholar.png')),
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "LogIn",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Customtextfeild(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return "Email is required";
                    }
                    if (!data.contains('@')) {
                      return 'Email must contain @';
                    }
                    if (!data.endsWith('@gmail.com')) {
                      return "Email must be a Gmail address";
                    }
                    return null;
                  },
                  onChanged: (date) {
                    Email = date;
                  },
                  label: "Email",
                  texthint: "Enter the Email",
                  icon: Icons.email,
                ),
                SizedBox(height: 16),
                Customtextfeild(
                  obsecure: true,
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  onChanged: (data) {
                    password = data;
                  },
                  label: "Password",
                  texthint: "Enter the password",
                  icon: Icons.visibility,
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    if (Formkey.currentState!.validate()) {
                      try {
                        await UserSignIn();
                        Navigator.pushNamed(
                          context,
                          Chatpage.chatid,
                          arguments: Email,
                        );
                        MessageUser(context, text: 'Success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          MessageUser(context, text: 'Email is not registered');
                        } else if (e.code == 'wrong-password') {
                          MessageUser(context, text: 'InCorrect-password');
                        }
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height: 45,
                    child: Center(
                      child: Text(
                        "LogIn",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "donot have an account? ",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registerpage.registerId);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UserSignIn() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email!,
      password: password!,
    );
  }
}
