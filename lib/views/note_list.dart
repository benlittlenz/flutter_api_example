import 'package:flutter/material.dart';
import 'package:flutter_api_requests/models/Note.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new Note(
      id: "1",
      title: 'Note 1',
      createDateTime: DateTime.now(),
      lastEdited: DateTime.now(),
    ),
    new Note(
      id: "2",
      title: 'Note 2',
      createDateTime: DateTime.now(),
      lastEdited: DateTime.now(),
    ),
    new Note(
      id: "3",
      title: 'Note 3',
      createDateTime: DateTime.now(),
      lastEdited: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(notes[index].title.toString(),
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              subtitle: Text("Last editied on ${notes[index].lastEdited}"),
            );
          },
          itemCount: notes.length),
    );
  }
}
