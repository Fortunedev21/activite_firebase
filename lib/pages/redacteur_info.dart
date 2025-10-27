import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'modifier_redacteur.dart';
import 'supprimer_redacteur.dart';

class RedacteurInfo extends StatelessWidget {
  RedacteurInfo({super.key});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informations des Rédacteurs')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('redacteurs').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final redacteurs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: redacteurs.length,
            itemBuilder: (context, index) {
              final data = redacteurs[index].data() as Map<String, dynamic>;
              final redacteurId = redacteurs[index].id;
              return Card(
                child: ListTile(
                  title: Text(data['nom'] ?? ''),
                  subtitle: Text(data['specialite'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ModifierRedacteurPage(
                                redacteurId: redacteurId,
                                redacteurData: data,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  SupprimerRedacteur(redacteurId: redacteurId),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
