import 'package:app/landing/landing_header.dart';
import 'package:app/landing/landing_body.dart';
import 'package:flutter/material.dart';
import 'package:app/landing/widgets/scroll_up_indicator.dart';

const dividerColor = Color(0xFF464751);
const primaryColor = Color.fromRGBO(47, 49, 64, 1.0);
const cardColor = Color.fromRGBO(54, 56, 72, 1.0);

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // Stack widgets on top of each other
      body: Stack(
        children: [
          // For better control on the web, we supply our ScrollController to
          // both parent Scrollbar and child SingleChildScrollView widgets.
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Header with texts and social media buttons.
                  LandingHeader(_scrollController),
                  const SizedBox(height: 56.0),

                  // Body with showcase apps.
                  const LandingBody(),
                ],
              ),
            ),
          ),

          // Bar on top, visible when header is invisible, with 2 buttons:
          //
          // 1. Scrolls page to up when clicked.
          //
          // 2. "BUILT WITH Flutter" indicator, redirects to open-source
          // repostitory containing source codes of this web app.
          ScrollUpIndicator(_scrollController),
        ],
      ),
    );
  }
}
