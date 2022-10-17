import 'package:app/landing/widgets/delayed_widget.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/animated_background_image.dart';
import 'package:app/landing/widgets/social_media_buttons.dart';
import 'package:app/utilities/extensions.dart';
import 'package:flutter/material.dart';

class LandingHeader extends StatelessWidget {
  final ScrollController scrollController;

  const LandingHeader(
    this.scrollController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipper(),
      child: Stack(
        children: [
          // Widget that has animated background image while scrolling
          AnimatedBackgroundImage(scrollController),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isDesktop
                  ? 280.0
                  : context.isMobile
                      ? 24
                      : 200,
              vertical: context.isDesktop
                  ? 180.0
                  : context.isMobile
                      ? 8
                      : 90,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/transparent.png',
                        image: 'assets/images/personal-logo.png',
                        height: 64.0,
                        width: 64.0,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    const Expanded(
                      child: DelayedWidget(
                        delayDuration: Duration(milliseconds: 1000),
                        from: DelayFrom.right,
                        child: SelectableText(
                          AppConstants.landingTitle,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22.0),
                const DelayedWidget(
                  delayDuration: Duration(milliseconds: 1400),
                  from: DelayFrom.top,
                  child: Divider(
                    thickness: 1.75,
                    color: dividerColor,
                  ),
                ),
                const SizedBox(height: 30.0),
                // const DelayedWidget(
                //   delayDuration: Duration(milliseconds: 1500),
                //   from: DelayFrom.top,
                //   child: SelectableText(
                //     AppConstants.landingMotto,
                //     style: TextStyle(
                //       fontSize: 17.0,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.white,
                //       letterSpacing: 1.8,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 24.0),
                const SocialMediaButtons()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Extracted from "flutter_custom_clippers" package.
class DiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - 112.0)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
