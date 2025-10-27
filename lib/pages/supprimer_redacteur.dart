import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SupprimerRedacteur extends StatelessWidget {
  final String redacteurId;
  const SupprimerRedacteur({super.key, required this.redacteurId});

  Future<void> _supprimerRedacteur(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('redacteurs')
        .doc(redacteurId)
        .delete();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Suppression réussie'),
        content: const Text('Le rédacteur a été supprimé avec succès.'),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmer la suppression')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Êtes-vous sûr de vouloir supprimer ce rédacteur ?'),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => _supprimerRedacteur(context),
                child: const Text('Supprimer le rédacteur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
