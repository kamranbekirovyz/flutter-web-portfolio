import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/widgets/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SocialMediaButton(
          url: AppConstants.gitHubProfileURL,
          iconData: FontAwesomeIcons.github,
        ),
        SizedBox(width: 18.0),
        SocialMediaButton(
          url: AppConstants.eMail,
          iconData: Icons.alternate_email_rounded,
        ),
        SizedBox(width: 18.0),
        SocialMediaButton(
          url: AppConstants.linkedInProfileURL,
          iconData: FontAwesomeIcons.linkedin,
        ),
        SizedBox(width: 16.0),
        SocialMediaButton(
          url: AppConstants.facebookProfileURL,
          iconData: FontAwesomeIcons.facebook,
        ),
        SizedBox(width: 16.0),
        SocialMediaButton(
          url: AppConstants.instagramProfileURL,
          iconData: FontAwesomeIcons.instagram,
        ),
      ],
    );
  }
}
