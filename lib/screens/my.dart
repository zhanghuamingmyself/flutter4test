import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdvancedWebView extends StatefulWidget {
  final String initialUrl;

  const AdvancedWebView({super.key, required this.initialUrl});

  @override
  State<AdvancedWebView> createState() => _AdvancedWebViewState();
}

class _AdvancedWebViewState extends State<AdvancedWebView> {
  late final WebViewController controller;
  var isLoading = true;
  var canGoBack = false;
  var canGoForward = false;
  String currentUrl = '';

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => _onProgress(progress),
          onPageStarted: (url) => _onPageStarted(url),
          onPageFinished: (url) => _onPageFinished(url),
          onWebResourceError: (error) => _onWebResourceError(error),
          onNavigationRequest: (request) => _onNavigationRequest(request),
          onUrlChange: (change) => _onUrlChange(change),
        ),
      )
      ..addJavaScriptChannel(
        name: 'Flutter',
        onMessageReceived: (message) => _onJavaScriptMessage(message),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  void _onProgress(int progress) {
    print('加载进度: $progress%');
  }

  void _onPageStarted(String url) {
    setState(() {
      isLoading = true;
      currentUrl = url;
    });
  }

  void _onPageFinished(String url) async {
    setState(() {
      isLoading = false;
    });

    // 更新导航状态
    final back = await controller.canGoBack();
    final forward = await controller.canGoForward();
    setState(() {
      canGoBack = back;
      canGoForward = forward;
    });

    // 获取页面标题
    final title = await controller.getTitle();
    print('页面加载完成: $title');
  }

  void _onWebResourceError(WebResourceError error) {
    print('资源加载错误: ${error.description}');
  }

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    // URL拦截逻辑 [3](@ref)
    final url = request.url.toLowerCase();

    if (url.contains('blocked-domain.com')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('该网站已被阻止访问')),
      );
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }

  void _onUrlChange(UrlChange change) {
    setState(() {
      currentUrl = change.url ?? '';
    });
  }

  void _onJavaScriptMessage(JavaScriptMessage message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('来自网页的消息'),
        content: Text(message.message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('高级WebView'),
        actions: _buildAppBarActions(),
      ),
      body: Column(
        children: [
          // URL地址栏
          _buildUrlBar(),
          // 进度条
          if (isLoading) _buildProgressBar(),
          // WebView内容
          Expanded(child: WebViewWidget(controller: controller)),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () => controller.reload(),
        tooltip: '刷新',
      ),
      IconButton(
        icon: const Icon(Icons.home),
        onPressed: () => controller.loadRequest(Uri.parse(widget.initialUrl)),
        tooltip: '首页',
      ),
    ];
  }

  Widget _buildUrlBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: const Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          const Icon(Icons.language, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              currentUrl,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: canGoBack ? _goBack : null,
            tooltip: '后退',
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: canGoForward ? _goForward : null,
            tooltip: '前进',
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: _openInBrowser,
            tooltip: '在浏览器中打开',
          ),
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: _showPageInfo,
            tooltip: '页面信息',
          ),
        ],
      ),
    );
  }

  Future<void> _goBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
    }
  }

  Future<void> _goForward() async {
    if (await controller.canGoForward()) {
      await controller.goForward();
    }
  }

  Future<void> _openInBrowser() async {
    // 使用url_launcher包在浏览器中打开
    // await launchUrl(Uri.parse(currentUrl));
  }

  Future<void> _showPageInfo() async {
    final title = await controller.getTitle();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('页面信息'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('标题: ${title ?? '未知'}'),
            Text('URL: $currentUrl'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}