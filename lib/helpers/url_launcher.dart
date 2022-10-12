import 'dart:js' as js;

void launchUrl(String url, {bool newTab = true}) {
  js.context.callMethod(
    'open',
    [url, newTab ? '_blank' : '_self'],
  );
}
