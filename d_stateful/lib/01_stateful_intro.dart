import 'package:d_stateful/01_increment.dart';
import 'package:d_stateful/01_reset.dart';
import 'package:d_stateful/01_state_button.dart';
import 'package:d_stateful/01_decrement.dart';
import 'package:flutter/material.dart';

// StatefulWidget
// 1. 개념
// Flutter에서 상태를 가지는 위젯을 정의할 때 사용하는 클래스입니다.
// 내부 상태를 가질 수 있으며, 상태에 따라서 UI가 동적으로 변경됩니다.
// 사용자와의 상호 작용, 네트워크 요청 결과 등으로 UI가 변하는 상황에서 사용합니다.
// 2. 특징
// 1) 상태 관리
// 상태는 State 객체에서 저장하며, State 객체는 StatefulWidget에 연결됩니다.
// 2) 생명 주기
// 상태가 변경될때마다 setState() 메소드를 호출해서 상태를 변경하고 UI를 업데이트합니다.
// 3) 구조
// StatefulWidget : State 생성 및 위젯의 기본 구조 정의
// State : 상태 관리 및 UI 빌드
// 3. 사용 방법
// 1) StatefulWidget 클래스 생성
// 2) State 클래스 생성
// 3) StatefulWidget 클래스에서 State 클래스 등록
// 4) State 클래스에서 상태 관리 및 UI 빌드

// State
//
// 1. 개념
// State는 플러터에서 앱의 현재 상태를 나타내는 데이터입니다.
// State는 UI와 밀접하게 연결되어 있으며, 데이터가 변경되면 UI를 다시 빌드하여 사용자에게 업데이트된 내용을 보여줍니다.
//
// 2. 주요 역할
//   1) UI와 데이터 동기화
//     (1) State는 UI가 현재 앱 상태를 반영하도록 유지합니다.
//     (2) 버튼 클릭, 사용자 입력, 네트워크 요청 결과 등으로 인해 상태가 변경되면 UI도 함께 업데이트됩니다.
//   2) State 유형
//     (1) Stateless : 상태가 없는 위젯으로 한 번 생성되면 UI가 고정됩니다.
//     (2) StatefulWidget : 상태를 가질 수 있는 위젯으로 데이터를 변경하고 UI를 다시 빌드할 수 있습니다.
//
// 3. 상태의 종류
//   1) 임시 상태(Ephemeral State)
//     (1) 특정 위젯에서만 사용되는 상태
//     (2) 텍스트 필드 값이나 스크롤 위치 등
//     (3) 주로 StatefulWidget과 setState()로 관리
//   2) 앱 상태(App State)
//     (1) 여러 화면이나 전체 애플리케이션에 영향을 미치는 상태
//     (2) 사용자 인증 정보, 테마 설정 등
//     (3) Provider, Riverpod, BLoC 등 고급 상태 관리 도구로 관리
//     (4) Flutter에서 공식적으로 권장하는 상태 관리 방법은 Provider
//
// 4. 생명 주기 메소드
//   1) initState() : 위젯이 처음 생성될 때 호출
//   2) build() : 상태가 변경될때마다 호출
//   3) didChangeDependencies() : 위젯의 의존성이 변경될 때 호출 (주로 inheritWidget과 함께 호출)
//   4) dispose() : 위젯이 제거될 때 호출


// [1] StatefulWidget 클래스 생성
class StatefulIntro extends StatefulWidget {

  const StatefulIntro({super.key});

  // [3] createState() 메소드 오버라이드
  @override
  _StatefulIntroState createState() {
    return _StatefulIntroState();
  }

}

// [2] State 클래스 생성
// 비공개(private) : 밑줄(_)로 시작하는 식별자(변수, 함수, 클래스, 메소드 등)
class _StatefulIntroState extends State<StatefulIntro> {

  // [4] 상태 정의 및 UI 빌드
  int _count = 0;  // 상태 _count

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    _count--;
    setState(() {});  // UI 업데이트를 위해서 setState() 메소드 호출
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("현재 _count 값 = $_count"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IncrementButton(onPressed: _increment),
              // DecrementButton(onPressed: _decrement),
              // ResetButton(onPressed: _reset),
              StateButton(onPressed: _increment, type: 1),
              StateButton(onPressed: _decrement, type: 2),
              StateButton(onPressed: _reset, type: 3),
            ],
          )
        ],
      )
    );
  }

}








