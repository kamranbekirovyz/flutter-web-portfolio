import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamranbekirovcom_website/screens/landing_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamran Bekirov',
      home: const LandingScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(),
        highlightColor: Colors.white,
      ),
    );
  }
}
