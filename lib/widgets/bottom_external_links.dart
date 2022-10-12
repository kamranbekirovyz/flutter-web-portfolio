import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamranbekirovcom_website/helpers/app_constants.dart';
import 'package:kamranbekirovcom_website/helpers/url_launcher.dart';

class BottomExternalLinks extends StatelessWidget {
  const BottomExternalLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 'flutter.dev' reference
        TextButton(
          onPressed: () {
            launchUrl(AppConstants.flutterWebSiteURL);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Image.asset(
              'assets/images/lockup_built-w-flutter.png',
              color: Colors.white,
              height: 40.0,
            ),
          ),
          // iconSize: 120.0,
        ),
        const SizedBox(width: 8.0),

        /// github repository reference
        TextButton(
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
      ],
    );
  }
}
