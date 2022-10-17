import 'package:app/landing/widgets/delayed_widget.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/animated_background_image.dart';
import 'package:app/landing/widgets/social_media_buttons.dart';
import 'package:app/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LandingHeader extends StatelessWidget {
  final ScrollController scrollController;

  const LandingHeader(
    this.scrollController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final titleSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 24.0),
        const Condition.largerThan(name: TABLET, value: 40.0),
      ],
    ).value;

    final logoSize = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 56.0),
        const Condition.largerThan(name: TABLET, value: 64.0),
      ],
    ).value;

    final mottoSize = ResponsiveValue<double>(
      context,
      defaultValue: 14.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.largerThan(name: TABLET, value: 16.0),
      ],
    ).value;

    final mottoTextAlignment = context.isDesktop ? TextAlign.start : TextAlign.center;

    final maxWidth = ResponsiveValue<double>(
      context,
      defaultValue: 602.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 800.0),
        const Condition.largerThan(name: TABLET, value: 1200.0),
      ],
    ).value!;

    return ClipPath(
      clipper: DiagonalPathClipper(),
      child: Stack(
        fit: StackFit.loose,
        children: [
          // Widget that has animated background image while scrolling
          AnimatedBackgroundImage(scrollController),

          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: const EdgeInsets.symmetric(
                vertical: 96.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Personal logo
                      ClipOval(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/transparent.png',
                          image: 'assets/images/personal-logo.png',
                          height: logoSize,
                          width: logoSize,
                        ),
                      ),
                      const SizedBox(width: 16.0),

                      // "KAMRAN BEKIROV"
                      Expanded(
                        child: DelayedWidget(
                          delayDuration: const Duration(milliseconds: 1000),
                          from: DelayFrom.right,
                          child: SelectableText(
                            AppConstants.landingTitle,
                            style: TextStyle(
                              fontSize: titleSize,
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

                  // Divider between
                  const DelayedWidget(
                    delayDuration: Duration(milliseconds: 1400),
                    from: DelayFrom.top,
                    child: Divider(
                      thickness: 1.75,
                      color: dividerColor,
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // "FLUTTER BY DAY, FLUTTER BY NIGHT (INCLUDING WEEKENDS)"
                  DelayedWidget(
                    delayDuration: const Duration(milliseconds: 1500),
                    from: DelayFrom.top,
                    child: SelectableText(
                      AppConstants.landingMotto,
                      textAlign: mottoTextAlignment,
                      style: TextStyle(
                        fontSize: mottoSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),

                  const SocialMediaButtons()
                ],
              ),
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
