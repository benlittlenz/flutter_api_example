import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {

  final notes = [

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
            title: Text('Hello', style: TextStyle(color: Theme.of(context).primaryColor)
            ),
            subtitle: Text("Last editied on 21/04/21"),
          );

        },
        itemCount: 30
      ),
    );
  }
}
