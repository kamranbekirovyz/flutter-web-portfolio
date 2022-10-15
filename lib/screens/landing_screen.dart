import 'package:app/widgets/built_with_flutter_indicator.dart';
import 'package:app/widgets/clipped_landing_header.dart';
import 'package:app/widgets/landing_body.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/scroll_up_indicator.dart';

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
      body: Stack(
        children: [
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClippedLandingHeader(_scrollController),
                  const SizedBox(height: 56.0),
                  const LandingBody(),
                ],
              ),
            ),
          ),

          // Bar, visible when header is invisible, with 2 buttons:
          //
          // 1. Scrolls page to up when clicked.
          //
          // 2. "BUILT WITH Flutter" indicator, redirects to open-source
          // repostitory containing source codes of this web app.
          ScrollUpIndicator(_scrollController),

          // Vertically "BUILT WITH Flutter" indicator, while header is visible.
          Align(
            alignment: Alignment.topRight,
            child: BuiltWithFlutterIndicator(_scrollController),
          ),
        ],
      ),
    );
  }
}
