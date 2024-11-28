import 'package:crud_firebase/pages/add_name_page.dart';
import 'package:crud_firebase/pages/dashboard_page.dart';
import 'package:crud_firebase/pages/edit_name_page%20copy.dart';
import 'package:crud_firebase/pages/home_page.dart';
import 'package:crud_firebase/pages/welcome_page.dart';
import 'package:flutter/material.dart';

//import de firebase

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

//pages


//Conf firestroe
void configureFirestore() {
  FirebaseFirestore.instance.settings = const Settings(
    host: 'firestore.googleapis.com', // Backend Firestore
    sslEnabled: true,                // Conexión segura
    persistenceEnabled: true,        // Persistencia offline
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureFirestore(); // Configura Firestore después de inicializar Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C.C.E.G.',
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/': (context) => const Home(),
        '/add': (context) => const addNamePage(),
        '/edit': (context) => const EditNamePage(),
      },
    );
  }
}

