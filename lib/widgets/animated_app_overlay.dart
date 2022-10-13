import 'package:flutter/material.dart';

class AnimatedAppOverlay extends StatelessWidget {
  final bool hovered;
  final List<String> topics;

  const AnimatedAppOverlay({
    Key? key,
    required this.hovered,
    required this.topics,
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
          topics.first,
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
