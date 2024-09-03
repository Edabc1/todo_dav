import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';

class SaveNote extends ChangeNotifier {
  final List<Note> _notes = [
    Note(
        title: 'Fazer lista de química',
        body: 'Os exercícios restantes e a letra d) dos 11 primeiros.',
        isCompleted: false),
    Note(
        title: 'Estudar para física',
        body: 'Assunto: termometría e dilatação',
        isCompleted: false),
  ];
  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void removeNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  void checkNote(int index) {
    _notes[index].isDone();
    notifyListeners();
  }
}
