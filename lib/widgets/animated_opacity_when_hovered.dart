import 'package:flutter/material.dart';

class AnimatedOpacityWhenHovered extends StatefulWidget {
  final Widget child;

  const AnimatedOpacityWhenHovered({
    required this.child,
    super.key,
  });

  @override
  State<AnimatedOpacityWhenHovered> createState() => _AnimatedOpacityWhenHoveredState();
}

class _AnimatedOpacityWhenHoveredState extends State<AnimatedOpacityWhenHovered> {
  late bool _hovered;

  @override
  void initState() {
    _hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      child: AnimatedOpacity(
        duration: kThemeAnimationDuration,
        opacity: _hovered ? 1.0 : .6,
        child: widget.child,
      ),
    );
  }
}
