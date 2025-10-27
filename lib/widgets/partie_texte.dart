import 'package:flutter/material.dart';

class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'Bienvenue sur Magazine Infos, votre source fiable pour toutes les dernières actualités, '
            'analyses et articles sur la culture, la technologie et bien plus encore.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
