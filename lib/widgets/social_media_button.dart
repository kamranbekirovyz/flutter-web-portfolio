import 'package:flutter/material.dart';
import 'package:kamranbekirovcom_website/helpers/url_launcher.dart';

class SocialMediaButton extends StatefulWidget {
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
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
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
        child: IconButton(
          onPressed: () => launchUrl(widget.url),
          icon: Icon(
            widget.iconData,
            color: Colors.white,
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
