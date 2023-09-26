import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlInBrowser(String url) async {
  Uri urlparsed=Uri.parse(url);
  if (!await launchUrl(urlparsed,mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}