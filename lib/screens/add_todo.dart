import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/models/save_note.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerBody = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: const TextStyle(fontSize: 28),
                controller: controllerTitle,
                decoration: const InputDecoration(
                  hintText: 'Título',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o títilo';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 18),
                controller: controllerBody,
                decoration: const InputDecoration(
                  hintText: 'Descrição',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a descrição';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (formKey.currentState!.validate()) {
              context.read<SaveNote>().addNote(Note(
                  title: controllerTitle.text,
                  body: controllerBody.text,
                  isCompleted: false));
              controllerTitle.clear();
              controllerBody.clear();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    Timer(const Duration(seconds: 3), () {
                      Navigator.of(context).pop(); // Fecha o Dialog
                      Navigator.of(context).pop(); // Fecha a tela atual
                    });
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Lottie.asset(
                        'assets/animations/Animation - 1725324698628.json',
                      ),
                    );
                  });
            }
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
