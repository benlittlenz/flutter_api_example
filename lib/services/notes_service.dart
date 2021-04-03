import 'package:flutter_api_requests/models/API_Response.dart';
import 'package:flutter_api_requests/models/Note.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/';

  Future<APIResponse<List<Note>>> getNoteList() {
    return http.get(API);
  }
}
