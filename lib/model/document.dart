import 'package:chat_test/const/constant.dart';

class Document {
  String message;
  String Email;
  String timemessage;
  Document({
    required this.message,
    required this.Email,
    required this.timemessage,
  });
  factory Document.fromjson(json) {
    return Document(
      message: json[kmessage],
      Email: json['Email'],
      timemessage: json['time'].toString(),
    );
  }
}
