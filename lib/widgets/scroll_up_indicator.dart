import 'package:flutter/material.dart';
import 'package:app/helpers/app_constants.dart';
import 'package:app/screens/landing_screen.dart';

class ScrollUpIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollUpIndicator(this.scrollController, {super.key});

  @override
  State<ScrollUpIndicator> createState() => _ScrollUpIndicatorState();
}

class _ScrollUpIndicatorState extends State<ScrollUpIndicator> {
  late bool _visible = false;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      if (offset > 360.0) {
        if (!_visible) setState(() => _visible = true);
      } else if (offset <= 360.0) {
        if (_visible) setState(() => _visible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: _visible
          ? Container(
              width: double.maxFinite,
              height: 56.0,
              alignment: Alignment.centerLeft,
              color: cardColor.withOpacity(.9),
              child: GestureDetector(
                onTap: () {
                  widget.scrollController.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          AppConstants.webSiteURL.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
