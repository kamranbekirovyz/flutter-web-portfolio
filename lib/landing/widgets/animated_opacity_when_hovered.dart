import 'package:flutter/material.dart';

// A widget that has 0.6 opacity on normal state, but when hovered it will have
// full visibility (1.0 opacity) and click cursor on it.
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
      cursor: SystemMouseCursors.click,
      child: AnimatedOpacity(
        duration: kThemeAnimationDuration,
        opacity: _hovered ? 1.0 : .6,
        child: widget.child,
      ),
    );
  }
}
