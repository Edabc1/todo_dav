import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';

class NoteView extends StatelessWidget {
  final Note note;
  const NoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          note.title,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          note.body,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
