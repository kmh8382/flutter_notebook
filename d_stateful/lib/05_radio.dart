import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {

  const RadioWidget({super.key});

  @override
  State<StatefulWidget> createState() => _RadioState();

}

// 열거형 정의 (Gender.Man, Gender.Woman)
enum Gender { Man, Woman }

class _RadioState extends State<RadioWidget> {

  // 상태 변수
  Gender? _gender;

  // 상태 변수 변경
  void _changeGender(Gender value) {
    setState(() {
      _gender = value;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Man"),
          value: Gender.Man,
          groupValue: _gender,
          onChanged: (Gender? value) {
            _changeGender(value!);
          }
        ),
        RadioListTile(
          title: const Text("Woman"),
          value: Gender.Woman,
          groupValue: _gender,
          onChanged: (Gender? value) {
            _changeGender(value!);
          }
        ),
      ],
    );
  }

}