import 'package:flutter/material.dart';

class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Column(
          children: [
            Icon(Icons.phone, size: 32),
            SizedBox(height: 4),
            Text('Tel'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.email, size: 32),
            SizedBox(height: 4),
            Text('Mail'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, size: 32),
            SizedBox(height: 4),
            Text('Partager'),
          ],
        ),
      ],
    );
  }
}
