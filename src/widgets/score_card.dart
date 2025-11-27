import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int score;

  const ScoreCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text('Score: $score', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
