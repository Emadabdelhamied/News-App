import'package:flutter/material.dart';
import 'package:news_app/shared/component/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebviewScreen extends StatelessWidget {
  final String url;
  WebviewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
