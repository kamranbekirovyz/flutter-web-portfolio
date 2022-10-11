import 'package:flutter/material.dart';

const dividerColor = Color.fromRGBO(70, 71, 81, 1.0);
const primaryColor = Color.fromRGBO(47, 49, 64, 1.0);

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: DiagonalPathClipperTwo(),
                child: Stack(
                  children: [
                    Container(
                      height: 552.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.cover,
                          // TODO: animate background image while scrolling may be?
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
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
                        children: const [
                          SelectableText(
                            'KAMRAN BEKIROV',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 4.0,
                            ),
                          ),
                          SizedBox(height: 22.0),
                          Divider(
                            thickness: 1.75,
                            color: dividerColor,
                          ),
                          SizedBox(height: 30.0),
                          SelectableText(
                            'FLUTTER BY DAY, FLUTTER BY NIGHT (INCLUDING WEEKENDS)',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: 1.8,
                            ),
                          ),
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
                  children: const [
                    Text(
                      'SHOWCASE',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 3.0,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    Divider(
                      thickness: 1.75,
                      color: dividerColor,
                    ),
                    SizedBox(height: 18.0),
                    SelectableText(
                      'FLUTTER BY DAY, FLUTTER BY NIGHT (INCLUDING WEEKENDS)',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.8,
                      ),
                    ),
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
