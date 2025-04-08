import 'package:flutter/material.dart';

// Switch
// on/off 상태를 나타내는 위젯으로 특정 기능의 활성화/비활성화를 나타낼 때 주로 사용합니다.

class SwitchWidget extends StatefulWidget {

  const SwitchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SwitchState();

}

class _SwitchState extends State<SwitchWidget> {

  // 상태 변수
  late bool _isOn;

  // 상태 변수 초기화
  @override
  void initState() {
    _isOn = false;
    super.initState();
  }

  // 상태 변수 변경
  void _toggle(bool value) {
    setState(() {
      _isOn = value;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: _isOn,
          onChanged: (bool? value) {
            _toggle(value!);
          }
        ),
        Text("$_isOn"),
      ],
    );
  }

}