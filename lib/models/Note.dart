class Note {
  String id;
  String title;
  DateTime createDateTime;
  DateTime lastEdited;

  Note({this.id, this.title, this.createDateTime, this.lastEdited});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
      id: item['noteID'],
      title: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEdited: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
