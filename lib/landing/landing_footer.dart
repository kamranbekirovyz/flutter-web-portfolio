import 'package:app/landing/widgets/animated_opacity_when_hovered.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/utilities/url_launcher.dart';

class LandingFooter extends StatelessWidget {
  const LandingFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GitHub repository reference.
        AnimatedOpacityWhenHovered(
          child: TextButton(
            onPressed: () {
              launchUrl(AppConstants.openSourceRepoURL);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Icon(
                FontAwesomeIcons.github,
                color: Colors.white,
                size: 44.0,
              ),
            ),
            // iconSize: 120.0,
          ),
        ),
      ],
    );
  }
}
