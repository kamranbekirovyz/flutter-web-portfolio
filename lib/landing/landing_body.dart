import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/delayed_widget.dart';
import 'package:app/utilities/showcase_app_model.dart';
import 'package:flutter/material.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/landing_footer.dart';
import 'package:app/landing/widgets/showcase_app_item.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';

class LandingBody extends StatelessWidget {
  const LandingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWrapper.of(context).isDesktop
            ? 104.0
            : ResponsiveWrapper.of(context).isTablet
                ? 56
                : 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 2800),
            from: DelayFrom.bottom,
            child: SelectableText(
              AppConstants.showcaseTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 2900),
            from: DelayFrom.bottom,
            child: Divider(
              thickness: 1.75,
              color: dividerColor,
            ),
          ),
          const SizedBox(height: 16.0),
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 3000),
            from: DelayFrom.bottom,
            child: SelectableText(
              AppConstants.showcaseDescription,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 3100),
            from: DelayFrom.bottom,
            child: SelectableText(
              AppConstants.disclaimer,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 56.0),

          // Grid list of showcase apps.
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 3200),
            from: DelayFrom.bottom,
            child: ResponsiveGridList(
              shrinkWrap: true,
              minSpacing: 24.0,
              desiredItemWidth: 296,
              children: apps.map((e) {
                return ShowcaseAppItem(e);
              }).toList(),
            ),
          ),
          const SizedBox(height: 120.0),

          // 2 Buttons at bottom of landing: flutter.dev, github.com.
          const LandingFooter(),
          const SizedBox(height: 120.0),
        ],
      ),
    );
  }
}
