import 'package:flutter/material.dart';

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _rubriqueCard('Actualités', Icons.article),
          _rubriqueCard('Technologie', Icons.computer),
          _rubriqueCard('Culture', Icons.palette),
        ],
      ),
    );
  }

  Widget _rubriqueCard(String titre, IconData icon) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 8),
          Text(titre, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
