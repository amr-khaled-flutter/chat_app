import 'package:chat_test/const/constant.dart';
import 'package:chat_test/model/document.dart';
import 'package:chat_test/widget/chat_bubble.dart';
import 'package:chat_test/widget/chat_bubble_two.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    kmessagecollection,
  );
  static String chatid = 'fjjf';
  final _scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String Email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(ktime, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Document> listdoc = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            listdoc.add(Document.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: kprimaryColor,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    width: 60,
                    height: 60,
                    image: AssetImage('assets/images/scholar.png'),
                  ),
                  Text(
                    "chat",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: listdoc.length,
                    itemBuilder: (context, index) {
                      return listdoc[index].Email == Email
                          ? ChatBubble(docu: listdoc[index])
                          : ChatBubbleTwo(docu: listdoc[index]);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'message': data,
                        ktime: DateTime.now(),
                        'Email': Email,
                      });
                      controller.clear();
                    },
                    decoration: InputDecoration(
                      hintText: "Send message",
                      suffixIcon: Icon(
                        Icons.send,
                        size: 35,
                        color: kprimaryColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: kprimaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: kprimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
