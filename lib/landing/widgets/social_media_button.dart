import 'package:app/landing/widgets/animated_opacity_when_hovered.dart';
import 'package:flutter/material.dart';
import 'package:app/utilities/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  final String url;
  final IconData iconData;
  final double size;

  const SocialMediaButton({
    required this.url,
    required this.iconData,
    this.size = 30.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacityWhenHovered(
      child: IconButton(
        onPressed: () => launchUrl(url),
        icon: Icon(
          iconData,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
