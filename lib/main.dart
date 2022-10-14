import 'package:flutter/material.dart';
import 'package:kamranbekirovcom_website/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // Removes "#" from URL, for more check out link below:
  // https://docs.flutter.dev/development/ui/navigation/url-strategies
  usePathUrlStrategy();

  runApp(const App());
}
