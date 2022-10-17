import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/widgets/social_media_button.dart';
import 'package:app/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final alignment = context.isDesktop ? WrapAlignment.start : WrapAlignment.center;
    final wrapAlignment = context.isMobile ? Alignment.center : null;

    return Container(
      alignment: wrapAlignment,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: alignment,
        children: const [
          SocialMediaButton(
            index: 0,
            url: AppConstants.gitHubProfileURL,
            iconData: FontAwesomeIcons.github,
          ),
          SocialMediaButton(
            index: 1,
            url: AppConstants.eMail,
            iconData: Icons.alternate_email_rounded,
          ),
          SocialMediaButton(
            index: 2,
            url: AppConstants.linkedInProfileURL,
            iconData: FontAwesomeIcons.linkedin,
          ),
          SocialMediaButton(
            index: 3,
            url: AppConstants.twitterURL,
            iconData: FontAwesomeIcons.twitter,
          ),
          SocialMediaButton(
            index: 4,
            url: AppConstants.facebookProfileURL,
            iconData: FontAwesomeIcons.facebook,
          ),
          SocialMediaButton(
            index: 5,
            url: AppConstants.instagramProfileURL,
            iconData: FontAwesomeIcons.instagram,
          ),
        ],
      ),
    );
  }
}
