import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModifierRedacteurPage extends StatefulWidget {
  final String redacteurId;
  final Map<String, dynamic> redacteurData;

  const ModifierRedacteurPage({
    super.key,
    required this.redacteurId,
    required this.redacteurData,
  });

  @override
  _ModifierRedacteurPageState createState() => _ModifierRedacteurPageState();
}

class _ModifierRedacteurPageState extends State<ModifierRedacteurPage> {
  late final TextEditingController _nomController;
  late final TextEditingController _specialiteController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.redacteurData['nom']);
    _specialiteController = TextEditingController(
      text: widget.redacteurData['specialite'],
    );
  }

  @override
  void dispose() {
    _nomController.dispose();
    _specialiteController.dispose();
    super.dispose();
  }

  Future<void> _enregistrerModifications() async {
    await _firestore.collection('redacteurs').doc(widget.redacteurId).update({
      'nom': _nomController.text,
      'specialite': _specialiteController.text,
    });
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Modification réussie'),
        content: const Text(
          'Les informations du rédacteur ont été mises à jour avec succès.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier un Rédacteur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom du rédacteur'),
            ),
            TextFormField(
              controller: _specialiteController,
              decoration: const InputDecoration(labelText: 'Spécialité'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _enregistrerModifications,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
