import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
          ],
        ),
      ),
    );
  }
}
