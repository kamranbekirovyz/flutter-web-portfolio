import 'package:flutter/material.dart';

import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';

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
    return SizedBox(
      height: 576.0,
      width: double.maxFinite,
      child: FadeIn(
        child: Opacity(
          opacity: 0.3,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/transparent.png',
            image: 'assets/images/background-min.jpg',
            fit: BoxFit.fitWidth,
            alignment: Alignment(0.0, _y),
          ),
        ),
      ),
    );
  }
}
