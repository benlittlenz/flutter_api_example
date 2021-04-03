
import 'package:flutter/foundation.dart';

class NoteCreate {
  String title;
  String content;

  NoteCreate({
    @required this.title,
    @required this.content
  });

  Map<String, dynamic>toJson() {
    return {
      "title": title.toString(),
      "content":  content.toString(),
    };
  }
}