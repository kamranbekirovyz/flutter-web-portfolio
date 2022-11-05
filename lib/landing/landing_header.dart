import 'package:app/landing/widgets/delayed_widget.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/animated_background_image.dart';
import 'package:app/landing/widgets/social_media_buttons.dart';
import 'package:app/utilities/diagonal_path_clipper.dart';
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
    return ClipPath(
      clipper: DiagonalPathClipper(),
      child: Stack(
        fit: StackFit.loose,
        children: [
          // Widget that has animated background image while scrolling
          AnimatedBackgroundImage(scrollController),

          // The part that is on the "AnimatedBackgroundImage" widget.
          Align(
            alignment: Alignment.center,
            child: _buildSurface(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSurface(BuildContext context) {
    // Altough the "responsive_framework" package handles most of the
    // responsiveness-related stuff for us, we need some cusotm styling based on
    // the current view whether it is mobile, tablet or desktop.
    //
    // At that moment, ResponsiveValue<T> comes very handy and I've added some
    // BuildContext extensions to it.

    // Title text size: when Tablet and Mobile = 24, when Desktop = 40
    final titleSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 24.0),
        const Condition.largerThan(name: TABLET, value: 40.0),
      ],
    ).value;

    // Logo size: when Tablet and Mobile = 56, when Desktop = 64
    final logoSize = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 56.0),
        const Condition.largerThan(name: TABLET, value: 64.0),
      ],
    ).value;

    // Motto text size: when Tablet and Mobile = 14, when Desktop = 16
    final mottoSize = ResponsiveValue<double>(
      context,
      defaultValue: 14.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.largerThan(name: TABLET, value: 16.0),
      ],
    ).value;

    // Motto text alignment: when Desktop = start, when Mobile and Tablet = center.
    final mottoTextAlignment = context.isDesktop ? TextAlign.start : TextAlign.center;

    // Max width of centered view when Mobile = 602, Tablet = 800, when Desktop = 1200
    final maxWidth = ResponsiveValue<double>(
      context,
      defaultValue: 602.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 800.0),
        const Condition.largerThan(name: TABLET, value: 1200.0),
      ],
    ).value!;

    return Container(
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
                  image: 'https://porelarte.tech/kamranbekirovcom/personal-logo.png',
                  placeholder: 'assets/images/transparent.png',
                  height: logoSize,
                  width: logoSize,
                ),
              ),
              const SizedBox(width: 16.0),

              // Text: "KAMRAN BEKIROV"
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

          // Text: "FLUTTER BY DAY, FLUTTER BY NIGHT (INCLUDING WEEKENDS)"
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

          // Obvious from its name :)
          const SocialMediaButtons()
        ],
      ),
    );
  }
}
