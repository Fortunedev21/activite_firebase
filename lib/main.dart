import 'package:activite_firebase/pages/ajout_redacteur.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/acceuil.dart';
import 'pages/redacteur_info.dart';

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
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/accueil',
      routes: {
        '/accueil': (context) => Accueil(),
        '/ajout': (context) => AjoutRedacteur(),
        '/redacteurs': (context) => RedacteurInfo(),
      },
    );
  }
}

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  static int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushNamed(context, '/redacteurs');
      } else {
        Navigator.pushNamed(context, '/accueil');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Text("Magazine Infos"),
        centerTitle: true,
        actions: [const Icon(Icons.search)],
      ),
      body: Accueil(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(child: Text('Page Links')),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Ajouter Redateur"),
            ),
            ListTile(leading: Icon(Icons.pages), title: Text("Rédacteurs")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_open),
            label: 'Rédacteur',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.pink[100],
        onTap: _onItemTapped,
      ),
    );
  }
}
