import 'package:flutter/material.dart';

// Widget displays Image.network or Image.asset on the basis of source.
class SourceAwareImage extends StatelessWidget {
  final String image;
  final bool isNetworkImage;

  const SourceAwareImage({
    required this.image,
    required this.isNetworkImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ? Image.network(
            image,
          )
        : Image.asset(
            image,
          );
  }
}
