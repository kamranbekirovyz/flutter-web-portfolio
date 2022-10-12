import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamranbekirovcom_website/domain/showcase_app.dart';
import 'package:kamranbekirovcom_website/helpers/app_constants.dart';
import 'package:kamranbekirovcom_website/helpers/url_launcher.dart';
import 'package:kamranbekirovcom_website/widgets/animated_background_image.dart';
import 'package:kamranbekirovcom_website/widgets/showcase_app_item.dart';

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
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: DiagonalPathClipperTwo(),
                child: Stack(
                  children: [
                    AnimatedBackgroundImage(_scrollController),
                    Container(
                      height: 552.0,
                      width: double.maxFinite,
                      color: primaryColor.withOpacity(.75),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 280.0,
                        vertical: 180.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SlitInDiagonal(
                            child: const SelectableText(
                              'KAMRAN BEKIROV',
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
                            'FLUTTER BY DAY, FLUTTER BY NIGHT (INCLUDING WEEKENDS)',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: 1.8,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  launchUrl(AppConstants.gitHubProfileUrl);
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.github,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const SizedBox(width: 18.0),
                              Transform.scale(
                                scale: 1.1,
                                child: IconButton(
                                  onPressed: () {
                                    launchUrl(AppConstants.eMail);
                                  },
                                  icon: const Icon(
                                    Icons.alternate_email_rounded,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18.0),
                              IconButton(
                                onPressed: () {
                                  launchUrl(AppConstants.linkedInProfileUrl);
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              IconButton(
                                onPressed: () {
                                  launchUrl(AppConstants.facebookProfileUrl);
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              IconButton(
                                onPressed: () {
                                  launchUrl(AppConstants.instagramProfileUrl);
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 56.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 104.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SelectableText(
                      'SHOWCASE',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 3.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(
                      thickness: 1.75,
                      color: dividerColor,
                    ),
                    const SizedBox(height: 16.0),
                    const SelectableText(
                      'MOBILE APPLICATIONS EITHER DEVELOPED COMPLETELY BY ME OR BY A TEAM WHERE I PARTICIPATED SIGNIFICANTLY',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.8,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const SelectableText(
                      'I do not claim ownership of projects below as some of them developed for companies I worked for and some for clients/clients of my clients while backend side is provided.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        letterSpacing: 1.8,
                      ),
                    ),
                    const SizedBox(height: 56.0),
                    Wrap(
                      spacing: 24.0,
                      runSpacing: 24.0,
                      children: apps.map((e) {
                        return ShowcaseAppItem(e);
                      }).toList(),
                    ),
                    const SizedBox(height: 120.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            launchUrl(AppConstants.flutterWebSiteURL);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                            child: Image.asset(
                              'assets/images/lockup_built-w-flutter.png',
                              color: Colors.white,
                              height: 40.0,
                            ),
                          ),
                          // iconSize: 120.0,
                        ),
                        const SizedBox(width: 8.0),
                        TextButton(
                          onPressed: () {
                            launchUrl(AppConstants.gitHubProfileUrl);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                            child: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                              size: 44.0,
                            ),
                          ),
                          // iconSize: 120.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 120.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiagonalPathClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - 112)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
