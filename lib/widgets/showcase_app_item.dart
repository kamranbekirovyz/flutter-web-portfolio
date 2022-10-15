import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/models/showcase_app.dart';
import 'package:app/screens/landing_screen.dart';
import 'package:app/widgets/animated_image_overlay.dart';
import 'package:app/widgets/external_link_button.dart';

class ShowcaseAppItem extends StatelessWidget {
  final ShowcaseApp app;

  const ShowcaseAppItem(
    this.app, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(4.0),
        bottomRight: Radius.circular(4.0),
      ),
      child: Stack(
        children: [
          _buildChild(),
          Positioned(
            top: 0.0,
            bottom: 200.0,
            left: 0.0,
            right: 0.0,
            child: AnimatedImageOverlay(app.topic),
          ),
        ],
      ),
    );
  }

  Widget _buildChild() {
    return Container(
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return app.isNetworkImage
        ? Image.network(
            app.image,
          )
        : Image.asset(
            app.image,
          );
  }

  Widget _buildBottom() {
    return Container(
      height: 201.0,
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppName(),
          const Divider(
            color: dividerColor,
            thickness: 1.5,
            height: 32.0,
          ),
          if (app.playStoreURL != null) ...[
            ExternalLinkButton(
              url: app.playStoreURL!,
              iconData: FontAwesomeIcons.googlePlay,
              label: 'Play Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.appStoreURL != null) ...[
            ExternalLinkButton(
              url: app.appStoreURL!,
              iconData: FontAwesomeIcons.appStoreIos,
              label: 'App Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.githubURL != null)
            ExternalLinkButton(
              url: app.githubURL!,
              iconData: FontAwesomeIcons.squareGithub,
              label: 'GitHub',
            ),
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Text(
      app.name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}
