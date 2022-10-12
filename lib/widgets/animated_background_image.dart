import 'package:flutter/material.dart';

class AnimatedBackgroundImage extends StatefulWidget {
  final ScrollController scrollController;

  const AnimatedBackgroundImage(this.scrollController, {super.key});

  @override
  State<AnimatedBackgroundImage> createState() => _AnimatedBackgroundImageState();
}

class _AnimatedBackgroundImageState extends State<AnimatedBackgroundImage> {
  late double _y;

  @override
  void initState() {
    super.initState();

    _y = 0.0;

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      /// Only update alignment of the background image while it is visible.
      if (offset < 500) {
        /// Divide current scroll offset by 1000 to make it more smooth.
        setState(() => _y = widget.scrollController.offset / 1000);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 552.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/background-min.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment(0.0, _y),
        ),
      ),
    );
  }
}
