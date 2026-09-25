import 'package:chat_test/model/document.dart';
import 'package:flutter/material.dart';

class ChatBubbleTwo extends StatelessWidget {
  Document docu;
  ChatBubbleTwo({required this.docu});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        padding: EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 10),
        margin: EdgeInsets.all(8),
        child: Text(
          docu.message,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
