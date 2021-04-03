import 'package:flutter_api_requests/models/Note.dart';

class NotesService {
  List<Note> getNoteList() {
    return [
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
  }
}
