import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 앱의 진입점
void main() {
  runApp(MyApp());
}

// 앱의 최상위 위젯 정의
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 모드 배너를 숨깁니다.
      home: WebViewExample(), // 첫 번째 화면으로 WebViewExample 위젯을 설정합니다.
    );
  }
}

// WebViewExample 위젯은 상태를 변경할 수 있는 StatefulWidget입니다.
class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState(); // 반환 타입 수정
}

// WebViewExample의 상태 관리 클래스
class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller; // WebView의 상태와 동작을 제어하는 컨트롤러입니다.

  // 원하는 색상을 변수로 설정
  final Color topColor = Colors.white; // 상단 색상
  final Color bottomColor = const Color.fromARGB(255, 32, 30, 67); // 하단 색상

  // 위젯 초기화 시 호출되는 메서드
  @override
  void initState() {
    super.initState();
    _controller = WebViewController() // WebView 컨트롤러를 초기화합니다.
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 실행을 허용합니다.
      ..loadRequest(Uri.parse('http://www.example.com')); // 웹사이트를 로드합니다.
  }

  // UI를 빌드하는 메서드
  @override
  Widget build(BuildContext context) {
    // 현재 기기의 상단과 하단 패딩을 가져옵니다.
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Column(
        children: [
          // 상단 색상 영역
          Container(
            height: padding.top,
            color: topColor,
          ),
          // 웹뷰 영역
          Expanded(
            child: SafeArea(
              top: false, // 상단은 이미 별도로 처리했으므로 false
              bottom: false, // 하단도 별도로 처리
              child: WebViewWidget(controller: _controller),
            ),
          ),
          // 하단 색상 영역
          Container(
            height: padding.bottom,
            color: bottomColor,
          ),
        ],
      ),
    );
  }
}