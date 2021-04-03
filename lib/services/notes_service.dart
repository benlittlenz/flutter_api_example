import 'dart:convert';

import 'package:flutter_api_requests/models/API_Response.dart';
import 'package:flutter_api_requests/models/Note.dart';
import 'package:flutter_api_requests/models/NoteDetail.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': '59a2bb6a-ff85-4adc-aaa8-399bc738ebfa'};

  Future<APIResponse<List<Note>>> getNoteList() {
    return http.get(Uri.https(API, '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Note>[];

        for (var item in jsonData) {
          notes.add(Note.fromJson(item));
        }
        return APIResponse<List<Note>>(data: notes);
      }
      return APIResponse<List<Note>>(
          error: true, errorMessage: "An error occured");
    });
  }

  Future<APIResponse<NoteDetail>> getNote(String id) {
    return http
        .get(Uri.https(API, '/notes/$id'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final res = json.decode(data.body);

        return APIResponse<NoteDetail>(data: NoteDetail.fromJson(res));
      }
      return APIResponse<NoteDetail>(
          error: true, errorMessage: "An error occured");
    });
  }
}
