import 'package:flutter/material.dart';

import '../widgets/partie_icone.dart';
import '../widgets/partie_rubrique.dart';
import '../widgets/partie_texte.dart';
import '../widgets/partie_titre.dart';
import 'ajout_redacteur.dart';
import 'redacteur_info.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magazine Infos')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Ajouter un Rédacteur'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AjoutRedacteur()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Informations des Rédacteurs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RedacteurInfo()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PartieTitre(),
          PartieTexte(),
          PartieIcone(),
          PartieRubrique(),
        ],
      ),
    );
  }
}
