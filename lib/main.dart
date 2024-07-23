import 'package:flutter/material.dart';
import 'dart:math';

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
    return CodeAppleWidgetWorkFour();

    
  }
}

class CodeAppleWidgetWorkFour extends StatefulWidget {
  const CodeAppleWidgetWorkFour({super.key});

  @override
  CodeAppleWidgetWorkFourIn createState() => CodeAppleWidgetWorkFourIn();
}

// 4강 강의 과제
class CodeAppleWidgetWorkFourIn extends State<CodeAppleWidgetWorkFour>{

  int _like = 4;

  void _likeCounter() {
    setState(() {
      _like++;
    });
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              '금호동3가', 
              style: TextStyle(
                fontSize: 20, 
                color: Colors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              )
            ),
            Transform.rotate(
              angle: pi / 2, // 90도 회전
              child: Icon(Icons.chevron_right),
            )
          ],
        ),
        actions: [
          Icon(Icons.search, color: Colors.black),
          Icon(Icons.menu, color: Colors.black),
          Stack(
            children: <Widget>[
              Icon(Icons.notifications_none, color: Colors.black),
              Positioned(  // 빨간 점을 오른쪽 상단에 위치시킵니다.
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 6,
                    minHeight: 6,
                  ),
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.network(
                    'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/ada/rtx-4080/geforce-ada-4080-og-1200x630.jpg',
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '엔비디아 RTX 4080 (지금 파격가 할인!!) 즉시 조립 설치 가능', 
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.w400,
                          
                          )
                        ),
                        Text(
                          '성동구 분당동 · 끌올 10 분전', 
                          style: TextStyle(fontSize: 10, color: Color.fromRGBO(188, 188, 188, 0.7))
                        ),
                        Text(
                          '4,000,000원', 
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: _likeCounter,
                              child: Row(
                                children: [
                                  Icon(Icons.favorite, color: Colors.red),
                                  Text('$_like')
                                ]
                              )
                            )
                          ]
                        ),
                      ]
                    ),
                  ), // 이 부분은 다른 위젯으로 채울 수 있습니다.
                ),
              ]
            ),
          )
        ]
      )
    )
  );
  }
}

// 4강 강의 내용
MaterialApp codeAppleWidgetStuFour() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar( 
        title: Text('앱임'), 
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search, color: Colors.white),
          Icon(Icons.more_vert)
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
            Text('Hello, World!', 
              style: TextStyle(
                fontSize: 40,
                //color: Color(0xff0000aa)
                color: Color.fromRGBO(0, 0, 170, 1),
                letterSpacing: 5,
                backgroundColor: Colors.yellow,
                fontWeight: FontWeight.w900
              )
            ),
            Icon(Icons.star, color: Colors.blue, size: 120),
            TextButton(
              onPressed: () {
                print('Hello, World!');
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red, width: 2)
                  ),
                ),
                overlayColor: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) {
                    if( states.contains(WidgetState.hovered)) {
                      return Colors.red.withOpacity(0.5);
                    }
                    if( states.contains(WidgetState.focused)) {
                      return Colors.green.withOpacity(0.5);
                    }
                    return null;
                  }
                )
              ),
              child: Text('test'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('글자')
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit_outlined))
          ]
        ),
      )
    )
  );
}

// 3강 강의 내용
MaterialApp codeAppleWidgetStuThree() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar( title: Text('앱임'), backgroundColor: Colors.blue),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          // width나 height를 꽉 차게 주려면 double.infinity를 사용하면 됨.
          // 단, 부모 위젯의 크기를 넘지 않음
          width: double.infinity, height: 200,
          // BoxDecoration을 사용하면 Container에 직접 color를 줄 수 없음
          //  color: Colors.blue,
          // 마진을 주려면 EdgeInsets안의 함수 호출하면됨.
          margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          
          child: Text("히히히히")
        ),
      )
    )
  );
}





// 2강 강의 내용
MaterialApp codeAppleWidgetStu() {
  // 위젯 : 화면을 구성하는 기본 단위
    // 위젯은 대괄호로 시작함.
    // MaterialApp : 마테리얼 위젯, 구글이 제공하는 마테리얼 테마를 이용할 수 있음
    return MaterialApp(
    //   //home: Text('안녕')
    //   //home: Icon(Icons.shop, color: Colors.red, size: 100.0),
    //   //home: Image.asset('assets/images/flutter_logo.png'),
    //   // width나 height의 매개값 숫자는 px이 아니라 LP라는 사이즈임
    //   //home: Container( width: 50, height: 50, color: Colors.tealAccent )
    //   // Center 위젯을 써야 중앙 정렬이 됨. 사용하지 않으면 부모 위젯의 크기만큼 차지함.
    //   // home: Center(
    //   //   child: Container( width: 50, height: 50, color: Colors.tealAccent ),
    //   // )
    //   // home: Scaffold(
    //   //   appBar: AppBar(backgroundColor: Color.fromRGBO(20, 20, 255, 0),),
    //   //   body: Container( width: 10, height: 10, color: Colors.blueAccent),
    //   //   bottomNavigationBar: BottomAppBar( child: Text('Hello, Flutter!')),  
    //   // )
    //   home: Scaffold(
    //     // 세로로 정렬하려면 Row
    //     // body: Row(
    //     //   // 위젯 안의 정렬(가로)
    //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     //   //crossAxisAlignment: CrossAxisAlignment.center,
    //     //   children: [
    //     //     Icon(Icons.star, color: Colors.blueGrey, size: 50.0),
    //     //     Icon(Icons.star, color: Colors.red, size: 50.0),
    //     //   ]
    //     // )
    //     // 가로로 정렬하려면 Column
    //     body: Column(
    //       // 위젯 안의 정렬(세로)
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Icon(Icons.star, color: Colors.blueGrey, size: 50.0),
    //         Icon(Icons.star, color: Colors.red, size: 50.0),
    //       ]
    //     )
    //   )
    );
}

// 2강 과제
MaterialApp codeAppleWidgetWork() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('앱임', style: TextStyle( fontSize: 20.0, color: Colors.white)), backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('안녕')
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page)
            ],
          ),
        )
      ),
    ),
  );
}