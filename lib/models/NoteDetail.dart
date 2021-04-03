class NoteDetail {
  String id;
  String title;
  String content;
  DateTime createDateTime;
  DateTime lastEdited;

  NoteDetail(
      {this.id,
      this.title,
      this.content,
      this.createDateTime,
      this.lastEdited});

  factory NoteDetail.fromJson(Map<String, dynamic> item) {
    return NoteDetail(
      id: item['noteID'],
      title: item['noteTitle'],
      content: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEdited: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
