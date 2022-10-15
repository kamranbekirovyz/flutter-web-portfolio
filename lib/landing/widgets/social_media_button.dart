import 'package:app/landing/widgets/animated_opacity_when_hovered.dart';
import 'package:app/landing/widgets/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/utilities/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  final String url;
  final IconData iconData;
  final double size;
  final int index;

  const SocialMediaButton({
    required this.url,
    required this.iconData,
    required this.index,
    this.size = 30.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 1500 + ((index + 1) * 125)),
      from: DelayFrom.bottom,
      child: AnimatedOpacityWhenHovered(
        child: IconButton(
          onPressed: () => launchUrl(url),
          icon: Icon(
            iconData,
            color: Colors.white,
            size: size,
          ),
        ),
      ),
    );
  }
}
