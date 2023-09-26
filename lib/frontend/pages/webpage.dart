import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/appbar.dart';


WebViewController? _controller;


class WebPage extends StatelessWidget { const
WebPage({Key? key, required this.url, required this.title}) : super(key: key);
final String url;
final String title;
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: buildAppBar(context,title),
    body: Builder(builder: (BuildContext context) {
      return WebView(
        onProgress: (url){EasyLoading.show(status: 'loading...');},
        onPageFinished: (url){EasyLoading.dismiss();},
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,

        backgroundColor: const Color(0x00000000),
          onWebViewCreated: (controller)=> _controller = controller,
      );
    }),
  );
}
}