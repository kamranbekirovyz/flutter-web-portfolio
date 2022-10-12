import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamranbekirovcom_website/domain/showcase_app.dart';
import 'package:kamranbekirovcom_website/helpers/app_constants.dart';
import 'package:kamranbekirovcom_website/widgets/animated_background_image.dart';
import 'package:kamranbekirovcom_website/widgets/bottom_external_links.dart';
import 'package:kamranbekirovcom_website/widgets/scroll_up_indicator.dart';
import 'package:kamranbekirovcom_website/widgets/showcase_app_item.dart';
import 'package:kamranbekirovcom_website/widgets/social_media_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';

const dividerColor = Color.fromRGBO(70, 71, 81, 1.0);
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
                  ClipPath(
                    clipper: DiagonalPathClipper(),
                    child: Stack(
                      children: [
                        AnimatedBackgroundImage(_scrollController),
                        Container(
                          height: 552.0,
                          width: double.maxFinite,
                          color: primaryColor.withOpacity(.75),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveWrapper.of(context).isDesktop
                                ? 280.0
                                : ResponsiveWrapper.of(context).isMobile
                                    ? 64
                                    : 200,
                            vertical: ResponsiveWrapper.of(context).isDesktop
                                ? 180.0
                                : ResponsiveWrapper.of(context).isMobile
                                    ? 48
                                    : 90,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SlitInDiagonal(
                                child: const SelectableText(
                                  AppConstants.landingTitle,
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 4.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              const Divider(
                                thickness: 1.75,
                                color: dividerColor,
                              ),
                              const SizedBox(height: 30.0),
                              const SelectableText(
                                AppConstants.landingMotto,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              _buildSocialMediaButtons()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 56.0),
                  Container(
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
                        const SelectableText(
                          AppConstants.showcaseTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Divider(
                          thickness: 1.75,
                          color: dividerColor,
                        ),
                        const SizedBox(height: 16.0),
                        const SelectableText(
                          AppConstants.showcaseDescription,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        const SelectableText(
                          AppConstants.disclaimer,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 56.0),
                        ResponsiveGridList(
                          shrinkWrap: true,
                          minSpacing: 24.0,
                          desiredItemWidth: 296,
                          children: apps.map((e) {
                            return ShowcaseAppItem(e);
                          }).toList(),
                        ),
                        const SizedBox(height: 120.0),
                        const BottomExternalLinks(),
                        const SizedBox(height: 120.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ScrollUpIndicator(_scrollController),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButtons() {
    return Row(
      children: const [
        SocialMediaButton(
          url: AppConstants.gitHubProfileURL,
          iconData: FontAwesomeIcons.github,
        ),
        SizedBox(width: 18.0),
        SocialMediaButton(
          url: AppConstants.eMail,
          iconData: Icons.alternate_email_rounded,
        ),
        SizedBox(width: 18.0),
        SocialMediaButton(
          url: AppConstants.linkedInProfileURL,
          iconData: FontAwesomeIcons.linkedin,
        ),
        SizedBox(width: 16.0),
        SocialMediaButton(
          url: AppConstants.facebookProfileURL,
          iconData: FontAwesomeIcons.facebook,
        ),
        SizedBox(width: 16.0),
        SocialMediaButton(
          url: AppConstants.instagramProfileURL,
          iconData: FontAwesomeIcons.instagram,
        ),
      ],
    );
  }
}

/// Extracted from "flutter_custom_clippers" package.
class DiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - 112.0)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
