import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  QuerySnapshot querySnapshot = await db.collection('people').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "nombre": data ['nombre'],
      "uid":doc.id,
    };
    people.add(person);
  }
  return people;
}

//guardar un name en base de datos
Future<void> addPeople(String nombre) async{
  await db.collection("people").add({"nombre": nombre});
}

//Actualizar
Future<void> updatePeople(String uid, String newName) async{
  await db.collection("people").doc(uid).set({"nombre": newName});
}

//borrar datos de firebase
Future<void> deletePeople(String uid) async {
  await db.collection("people").doc(uid).delete();
}