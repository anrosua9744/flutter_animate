import 'package:flutter/material.dart';

void main() => runApp(heroApp());

class heroApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        //hero 추가
        child: Hero(
          // Hero의 tag. 애니메이션 될 hero들은 동일 tag를 가져야함
          tag: 'imageHero',
          //Hero에 이미지 추가. 외부 이미지를 가져옴
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
        onTap: () {
          Navigator.push((context), MaterialPageRoute(builder: (context) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hero 위젯이 ontap을 제공되지 않으므로 GestureDetector로 묶어서 기능 부여
      body: GestureDetector(
        child: Center(
          child: Hero(
            //Hero 의 tag. 애니메이션 될 Hero 동일 tag 가져야함
            tag: 'imageHero',
            // Hero에 이미지 추기. 동일 이미지를 이용해서 한 이미지가 스크린을 넘나드느느 애니메이션 효과 제공
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
        // 탭하면 현재 스크린을 pop하여 제거
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}