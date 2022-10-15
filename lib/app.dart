import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, child!),
          minWidth: 450,
          debugLog: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          background: Container(color: primaryColor),
        );
      },
      home: const LandingScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
    );
  }
}
