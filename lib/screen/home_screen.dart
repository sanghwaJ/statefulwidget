import 'package:flutter/material.dart';

// StatelessWidget에서 option + enter를 통해 손쉽게 statefulWidget으로 변경이 가능함
class HomeScreen extends StatefulWidget {
  final Color color;

  // constructor
  HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key) {
    print('widget constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('createState');
    // 외부에서 state만 불러서 사용하지 못하도록 private 선언
    return _HomeScreenState();
  }
}

// State<?>에 바인딩할 StatefulWidget을 지정해주어야 함
class _HomeScreenState extends State<HomeScreen> {
  int number = 0;

  @override
  void initState() {
    print('initState');
    // initState를 override할 땐, 아래의 코드가 꼭 필요함
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    // didChangeDependencies를 override할 땐, 아래의 코드가 꼭 필요함
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    // GestureDetector => 감싸고 있는 위젯 안에서 동작하는 액션(줌, 길게 누름 등)들을 캐치
    return GestureDetector(
      onTap: (){
        // setState 실행 => dirty => build => clean
        setState(() {
          number++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        // 생성자를 통해 color를 받아오면 재사용이 안됨
        // 아래의 widget 키워드를 사용하면, 지정된 widget의 color를 가져올 수 있음
        color: widget.color,
        child: Center(
          child: Text(number.toString()),
        ),
      ),
    );
  }
}
