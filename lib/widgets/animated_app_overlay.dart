import 'package:flutter/material.dart';

class AnimatedAppOverlay extends StatelessWidget {
  final bool hovered;
  final String topic;

  const AnimatedAppOverlay({
    Key? key,
    required this.hovered,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kThemeAnimationDuration,
      opacity: hovered ? 1.0 : 0.0,
      child: Container(
        alignment: Alignment.center,
        color: Colors.black54,
        child: Text(
          topic,
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
