import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administrar Cursos'),
        backgroundColor: Colors.blueAccent, 
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('lib/assets/images/profesor.png'), 
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100], 
        child: FutureBuilder(
          future: getPeople(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(snapshot.data?[index]['uid'] ?? 'sin_uid'),
                    onDismissed: (direction) async {
                      await deletePeople(snapshot.data?[index]['uid']);
                      setState(() {
                        snapshot.data?.removeAt(index);
                      });
                    },
                    confirmDismiss: (direction) async {
                      bool result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("¿Está seguro de querer eliminar a ${snapshot.data?[index]['nombre'] ?? 'Sin nombre'}?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text("Cancelar", style: TextStyle(color: Colors.red)),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text("Sí, estoy seguro"),
                              ),
                            ],
                          );
                        },
                      );
                      return result;
                    },
                    background: Container(
                      color: Colors.redAccent,
                      child: const Icon(Icons.delete),
                    ),
                    direction: DismissDirection.endToStart,
                    child: Card(
                      color: Colors.white, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.blueAccent, width: 1),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          snapshot.data?[index]['nombre'] ?? 'Sin nombre',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('UID: ${snapshot.data?[index]['uid'] ?? 'sin UID'}'),
                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                        onTap: () async {
                          await Navigator.pushNamed(context, "/edit", arguments: {
                            "nombre": snapshot.data?[index]['nombre'],
                            "uid": snapshot.data?[index]['uid'],
                          });
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ), 
              );
            } else {
              return const Center(child: Text("No hay datos disponibles"));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}