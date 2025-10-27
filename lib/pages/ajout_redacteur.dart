import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AjoutRedacteur extends StatefulWidget {
  const AjoutRedacteur({super.key});

  @override
  _AjoutRedacteurState createState() => _AjoutRedacteurState();
}

class _AjoutRedacteurState extends State<AjoutRedacteur> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _specialiteController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _specialiteController.dispose();
    super.dispose();
  }

  Future<void> _ajouterRedacteur() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('redacteurs').add({
        'nom': _nomController.text,
        'specialite': _specialiteController.text,
      });
      _afficherSuccesDialog();
    }
  }

  void _afficherSuccesDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ajout réussi'),
        content: const Text('Le rédacteur a été ajouté avec succès.'),
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
      appBar: AppBar(title: const Text('Ajouter un Rédacteur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom du rédacteur',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer un nom' : null,
              ),
              TextFormField(
                controller: _specialiteController,
                decoration: const InputDecoration(labelText: 'Spécialité'),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer une spécialité' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _ajouterRedacteur,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
