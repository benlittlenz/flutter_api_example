import 'package:flutter/material.dart';
import 'package:flutter_api_requests/models/API_Response.dart';
import 'package:flutter_api_requests/models/Note.dart';
import 'package:flutter_api_requests/services/notes_service.dart';
import 'package:flutter_api_requests/views/note_modify.dart';
import 'package:flutter_api_requests/views/note_delete.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.instance<NotesService>();

  APIResponse<List<Note>> _notes;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _notes = await service.getNoteList();

    debugPrint(_notes.toString());

    setState(() {
      _isLoading = false;
    });
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
            MaterialPageRoute(builder: (_) => NoteModify()))
            .then((_) {
              _fetchNotes();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(_notes.data[index].id),
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
                title: Text(_notes.data[index].title.toString(),
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                subtitle: Text(
                    "Last editied on ${formatDateTime(_notes.data[index].lastEdited ?? _notes.data[index].createDateTime)}"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => NoteModify(noteID: _notes.data[index].id)),
                  );
                },
              ),
            );
          },
          itemCount: _notes.data.length,
          ),
    );
  }
}
