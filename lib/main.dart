import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/acceuil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine Infos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Accueil(),
      debugShowCheckedModeBanner: false,
    );
  }
}
