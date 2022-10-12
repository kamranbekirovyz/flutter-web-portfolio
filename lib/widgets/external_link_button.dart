import 'package:flutter/material.dart';

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
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(width: 20.0),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
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
