import 'package:app/utilities/app_constants.dart';
import 'package:app/utilities/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:super_banners/super_banners.dart';

class BuiltWithFlutterIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const BuiltWithFlutterIndicator(this.scrollController, {super.key});

  @override
  State<BuiltWithFlutterIndicator> createState() => _BuiltWithFlutterIndicatorState();
}

class _BuiltWithFlutterIndicatorState extends State<BuiltWithFlutterIndicator> {
  late bool _visible = true;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      if (offset < 360.0) {
        if (!_visible) setState(() => _visible = true);
      } else if (offset >= 360.0) {
        if (_visible) setState(() => _visible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: _visible
          ? GestureDetector(
              onTap: () {
                launchUrl(AppConstants.openSourceRepoURL);
              },
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: BuiltWithFlutterCornerBanner.positioned(
                  bannerPosition: CornerBannerPosition.topRight,
                  bannerColor: primaryColor,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
