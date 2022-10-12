import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamranbekirovcom_website/domain/showcase_app.dart';
import 'package:kamranbekirovcom_website/screens/landing_screen.dart';
import 'package:kamranbekirovcom_website/widgets/external_link_button.dart';

class ShowcaseAppItem extends StatefulWidget {
  final ShowcaseApp app;

  const ShowcaseAppItem(
    this.app, {
    Key? key,
  }) : super(key: key);

  @override
  State<ShowcaseAppItem> createState() => _ShowcaseAppItemState();
}

class _ShowcaseAppItemState extends State<ShowcaseAppItem> {
  late bool _hovered;

  @override
  void initState() {
    _hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      child: AnimatedScale(
        duration: kThemeAnimationDuration,
        scale: _hovered ? 1.02 : 1.0,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
          child: Container(
            color: cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),
                _buildBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return widget.app.isNetworkImage
        ? Image.network(
            widget.app.image,
          )
        : Image.asset(
            widget.app.image,
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
          if (widget.app.playStoreURL != null) ...[
            ExternalLinkButton(
              url: widget.app.playStoreURL!,
              iconData: FontAwesomeIcons.googlePlay,
              label: 'Play Store',
            ),
            const SizedBox(height: 8.0),
          ],
          if (widget.app.appStoreURL != null) ...[
            ExternalLinkButton(
              url: widget.app.appStoreURL!,
              iconData: FontAwesomeIcons.appStoreIos,
              label: 'App Store',
            ),
            const SizedBox(height: 8.0),
          ],
          if (widget.app.githubURL != null)
            ExternalLinkButton(
              url: widget.app.githubURL!,
              iconData: FontAwesomeIcons.squareGithub,
              label: 'GitHub',
            ),
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Text(
      widget.app.name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}
