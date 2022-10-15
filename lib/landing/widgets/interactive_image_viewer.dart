import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/source_aware_image.dart';
import 'package:flutter/material.dart';

class InteractiveImageViewer extends StatefulWidget {
  final String image;
  final bool isNetworkImage;

  const InteractiveImageViewer({
    required this.image,
    required this.isNetworkImage,
    super.key,
  });

  @override
  State<InteractiveImageViewer> createState() => _InteractiveImageViewerState();
}

class _InteractiveImageViewerState extends State<InteractiveImageViewer> {
  late final TransformationController _transformationController;
  late TapDownDetails _doubleTapDetails;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(.25),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        actions: const [
          CircleAvatar(
            backgroundColor: primaryColor,
            child: CloseButton(),
          ),
          SizedBox(width: 24.0),
        ],
      ),
      body: InteractiveViewer(
        transformationController: _transformationController,
        child: SizedBox(
          // Set width as "double.maxFinite" so that image can expand its width
          // while zooming.
          width: double.maxFinite,
          child: GestureDetector(
            // Zoom image 2x, when double tapped.
            onDoubleTapDown: _handleDoubleTapDown,
            onDoubleTap: _handleDoubleTap,
            child: SourceAwareImage(
              image: widget.image,
              isNetworkImage: widget.isNetworkImage,
            ),
          ),
        ),
      ),
    );
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0);
    }
  }
}
