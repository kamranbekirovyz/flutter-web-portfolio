import 'package:flutter/material.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,

      // Initializing responsive_framework here.
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          minWidth: 300,
          debugLog: true,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          background: Container(color: primaryColor),
        );
      },
      home: const LandingScreen(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Ubuntu',
      ),
    );
  }
}
