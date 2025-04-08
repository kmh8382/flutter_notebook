import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {

  const CheckboxWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CheckboxState();
  }

}

class _CheckboxState extends State<CheckboxWidget> {

  // 상태 변수
  late bool _isChecked;

  // 상태 변수 초기화를 위한 initState() 메소드
  @override
  void initState() {
    super.initState();
    _isChecked = false;
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {

    // [1] Checkbox 와 Text 따로 만들기
    /*
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {  // Checkbox 의 체크 여부가 onChanged 의 매개변수 value 로 전달
            setState(() {
              // _isChecked = value!;  value! : value는 null이 아니다.
              _isChecked = value ?? false;  // value가 null이면 false를 저장한다.
            });
          }
        ),
        Text("$_isChecked"),
      ],
    );
    */

    // [2] Checkbox 와 Text 가 하나로 관리되는 CheckboxListTile
    return CheckboxListTile(
      title: Text("$_isChecked"),
      controlAffinity: ListTileControlAffinity.leading,
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value!;
        });
      }
    );

  }

}