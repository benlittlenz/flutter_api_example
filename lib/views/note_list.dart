import 'package:flutter/material.dart';
import 'package:flutter_api_requests/models/Note.dart';
import 'package:flutter_api_requests/views/note_create.dart';
import 'package:flutter_api_requests/views/note_delete.dart';

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

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => NoteModify()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].id),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                //
              },
              confirmDismiss: (direction) async {
                return await showDialog(
                    context: context, builder: (_) => NoteDelete());
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16),
                child: Align(
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerLeft),
              ),
              child: ListTile(
                title: Text(notes[index].title.toString(),
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                subtitle: Text(
                    "Last editied on ${formatDateTime(notes[index].lastEdited)}"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => NoteModify(noteID: notes[index].id)),
                  );
                },
              ),
            );
          },
          itemCount: notes.length),
    );
  }
}
