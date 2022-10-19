import 'package:flutter/material.dart';
import 'package:app/utilities/url_launcher.dart';

class ExternalLinkButton extends StatelessWidget {
  final String url;
  final String label;
  final IconData iconData;

  const ExternalLinkButton({
    required this.url,
    required this.label,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launchUrl(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(width: 24.0),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
