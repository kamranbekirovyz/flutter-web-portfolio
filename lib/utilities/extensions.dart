import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Some utility extensions on responsive_framework package.
extension BuildContextX on BuildContext {
  ResponsiveWrapperData get responsiveness {
    return ResponsiveWrapper.of(this);
  }

  bool get isMobile => responsiveness.isPhone;
  bool get isTablet => responsiveness.isTablet;
  bool get isDesktop => responsiveness.isDesktop;
}
