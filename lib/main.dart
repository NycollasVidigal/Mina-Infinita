import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  // Isso garante que os plugins funcionem antes do app abrir
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: MinaInfinitaApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MinaInfinitaApp extends StatefulWidget {
  const MinaInfinitaApp({super.key});

  @override
  State<MinaInfinitaApp> createState() => _MinaInfinitaAppState();
}

class _MinaInfinitaAppState extends State<MinaInfinitaApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://nycollasvidigal.github.io/Mina-Infinita/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O segredo da tela cheia: remover o AppBar e usar SafeArea(top: false)
      body: SafeArea(
        top: false, 
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}