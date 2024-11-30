import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// 앱의 진입점
void main() {
  runApp(MyApp());
}

// 앱의 최상위 위젯 정의
class MyApp extends StatelessWidget {
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
  @override
  _WebViewExampleState createState() => _WebViewExampleState(); // 이 위젯에 연결된 상태를 생성합니다.
}

// WebViewExample의 상태 관리 클래스
class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller; // WebView의 상태와 동작을 제어하는 컨트롤러입니다.
  
  // 위젯 초기화 시 호출되는 메서드
  @override
  void initState() {
    super.initState();
    _controller = WebViewController() // WebView 컨트롤러를 초기화합니다.
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 실행을 허용합니다.
      //..loadRequest(Uri.parse('https://flutter.dev'));
      ..loadRequest(Uri.parse('https://naver.com/')); // 웹사이트를 로드합니다.
  }

  // UI를 빌드하는 메서드
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LawGenda'), // 앱바의 제목을 설정합니다.
      ),
      body: WebViewWidget(controller: _controller), // WebView를 화면에 표시합니다.
    );
  }
}