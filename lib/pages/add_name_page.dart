import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class addNamePage extends StatefulWidget {
  const addNamePage({super.key});

  @override
  State<addNamePage> createState() => _addNamePageState();
}

class _addNamePageState extends State<addNamePage> {

  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Curso"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingresa Nuevo curso',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
              await addPeople(nameController.text).then((_){
                Navigator.pop(context);
              });
              
            }, 
            child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}