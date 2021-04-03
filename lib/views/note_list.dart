import 'package:flutter/material.dart';
import 'package:flutter_api_requests/models/Note.dart';
import 'package:flutter_api_requests/services/notes_service.dart';
import 'package:flutter_api_requests/views/note_create.dart';
import 'package:flutter_api_requests/views/note_delete.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.instance<NotesService>();
  List<Note> notes = [];

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  void initState() {
    notes = service.getNoteList();
    super.initState();
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
