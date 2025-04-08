import 'package:flutter/material.dart';

// Slider
// 사용자가 연속적인 값의 범위 내에서 특정 값을 선택할 수 있도록 슬라이더를 제공하는 위젯입니다.
// double 타입의 값을 사용하고 기본 값은 0.0 ~ 1.0 입니다.

class SliderWidget extends StatefulWidget {

  const SliderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SliderState();

}

class _SliderState extends State<SliderWidget> {

  // 상태 변수
  double _score = 0.0;  // initState() 메소드 호출 생략 가능

  // 상태 변수 변경
  void _setScore(double score) {
    setState(() {
      _score = score;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${_score.toInt()}"),
        Slider(
          min: 0,
          max: 100,
          divisions: 100,
          value: _score,
          onChanged: (double? value) {
            _setScore(value!);
          }
        ),
      ],
    );
  }

}