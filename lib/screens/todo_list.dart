import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/save_note.dart';
import 'package:todo/screens/note_view.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
      ),
      body: Consumer<SaveNote>(
        builder: (context, note, child) {
          return ListView.builder(
            itemCount: note.notes.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NoteView(note: note.notes[index])));
                },
                child: ListTile(
                  title: Text(
                    note.notes[index].title,
                    style: TextStyle(
                        decorationThickness: 4,
                        decoration: note.notes[index].isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing: Wrap(
                    children: [
                      Checkbox(
                          value: note.notes[index].isCompleted,
                          onChanged: (_) {
                            context.read<SaveNote>().checkNote(index);
                          }),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text(
                                          'Você deseja apagar esta nota?'),
                                      content: RichText(
                                        text: TextSpan(
                                            text:
                                                "'${note.notes[index].title}' será apagada."),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<SaveNote>()
                                                  .removeNote(
                                                      note.notes[index]);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Apagar')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancelar')),
                                      ],
                                    ));
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addtodopage');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
