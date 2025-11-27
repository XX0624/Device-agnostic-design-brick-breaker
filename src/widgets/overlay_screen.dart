import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import 'score_card.dart';

class OverlayScreen extends StatelessWidget {
  static const String id = 'gameOverlay';

  final BrickBreakerGame game;

  const OverlayScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ScoreCard(score: game.score),
      ),
    );
  }
}
