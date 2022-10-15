// Extracted from: https://pub.dev/packages/delayed_widget

import 'package:flutter/material.dart';

enum DelayFrom {
  left,
  right,
  top,
  bottom,
}

class DelayedWidget extends StatefulWidget {
  final Widget child;
  final Duration delayDuration;
  final Duration duration;
  final DelayFrom from;

  const DelayedWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delayDuration = Duration.zero,
    this.from = DelayFrom.bottom,
  }) : super(key: key);

  @override
  DelayedWidgetState createState() => DelayedWidgetState();
}

class DelayedWidgetState extends State<DelayedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _animationControllerDisposed = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(widget.delayDuration);
      if (!_animationControllerDisposed) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: _offset(),
          child: Opacity(
            opacity: 1.0 - (_animation.value),
            child: widget.child,
          ),
        );
      },
    );
  }

  Offset _offset() {
    double extent = 30.0;

    switch (widget.from) {
      case DelayFrom.left:
        extent = extent - (extent * 2);

        return Offset(extent * _animation.value, 0.0);

      case DelayFrom.right:
        return Offset(extent * _animation.value, 0.0);

      case DelayFrom.top:
        extent = extent - (extent * 2);

        return Offset(0.0, extent * _animation.value);

      case DelayFrom.bottom:
        return Offset(0.0, extent * _animation.value);
    }
  }
}
