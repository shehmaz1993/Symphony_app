import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebServiceScreen extends StatefulWidget {
  final String? url;
  final String? title;

  const WebServiceScreen({super.key,  this.url,this.title});

  @override
  State<WebServiceScreen> createState() => _WebServiceScreenState();
}

class _WebServiceScreenState extends State<WebServiceScreen> {
  late InAppWebViewController _webViewController;
  late PullToRefreshController _pullToRefreshController;
  late InAppWebViewGroupOptions _options;

  @override
  void initState() {
    super.initState();

    // Initialize the pull-to-refresh controller
    _pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        _webViewController.reload();
      },
    );

    // Initialize WebView options
    _options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        useOnLoadResource: true,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true, // Recommended for Flutter >= 3.0
      ),
    );
  }

  @override
  void dispose() {
    _pullToRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!),centerTitle: true,),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: false, // Disable JS
          domStorageEnabled: false, // Disable Local Storage
        ),
        initialUrlRequest: URLRequest(url: WebUri(widget.url!), ),
        initialOptions: _options,
        pullToRefreshController: _pullToRefreshController,
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {
          print("Started loading: $url");
        },
        onLoadStop: (controller, url) async {
          print("Stopped loading: $url");
          _pullToRefreshController.endRefreshing();
        },
        onProgressChanged: (controller, progress) {
          print("Progress: $progress%");
        },
      ),
    );
  }

}

