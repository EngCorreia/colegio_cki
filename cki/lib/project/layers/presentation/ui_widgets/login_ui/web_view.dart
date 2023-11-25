
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewName extends StatefulWidget {
  final  String? baseUrl;
  const WebViewName({Key? key, this.baseUrl}) : super(key: key);

  @override
  State<WebViewName> createState() => _WebViewNameState();
}

class _WebViewNameState extends State<WebViewName> {

  late WebViewController controller;
  bool pageOpened = false;


  void setBool() {
    setState(() {
      pageOpened = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.baseUrl,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            onPageStarted: (url) {
              //  log("new URL $url");
            },
            onPageFinished: (url) {
              // log("AGORA TERMINOU $url");
            },

          ),
        ),
      ),
    );
  }
}