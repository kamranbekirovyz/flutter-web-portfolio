import 'package:app/landing/widgets/interactive_image_viewer.dart';
import 'package:app/landing/widgets/source_aware_image.dart';
import 'package:app/utilities/showcase_app_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/animated_image_overlay.dart';
import 'package:app/landing/widgets/external_link_button.dart';

class ShowcaseAppItem extends StatelessWidget {
  final ShowcaseAppModel app;

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
            child: GestureDetector(
              // When overlay tapped, open full screen interactive image viewer.
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return InteractiveImageViewer(
                      image: app.image,
                      isNetworkImage: app.isNetworkImage,
                    );
                  },
                );
              },
              child: AnimatedImageOverlay(app.topic),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: add lineheights
  Widget _buildChild() {
    return Container(
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 552.0,
            child: SourceAwareImage(
              image: app.image,
              isNetworkImage: app.isNetworkImage,
            ),
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      height: 210.0,
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppName(),
              const Divider(
                color: dividerColor,
                thickness: 1.5,
                height: 32.0,
              ),
            ],
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
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}
