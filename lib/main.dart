import 'package:flutter/material.dart';

void main() async {
  // runApp : App 구동 함수
  // runApp 함수는 위젯을 화면에 그리는 역할을 한다.
  // runApp 안에 실행할 위젯을 넣어주면 된다.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // 위젯 : 화면을 구성하는 기본 단위
    // 위젯은 대괄호로 시작함.
    return MaterialApp(
      //home: Text('안녕')
      //home: Icon(Icons.shop, color: Colors.red, size: 100.0),
      //home: Image.asset('assets/images/flutter_logo.png'),
      // width나 height의 매개값 숫자는 px이 아니라 LP라는 사이즈임
      //home: Container( width: 50, height: 50, color: Colors.tealAccent )
      // Center 위젯을 써야 중앙 정렬이 됨. 사용하지 않으면 부모 위젯의 크기만큼 차지함.
      home: Center(
        child: Container( width: 50, height: 50, color: Colors.tealAccent ),
      )
    );
  }
}
