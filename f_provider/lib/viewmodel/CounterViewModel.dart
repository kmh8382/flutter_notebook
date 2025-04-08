// ViewModel
// Model 과 View 사이에서 데이터를 중개하고, 상태 관리를 수행합니다.
// Model 에서 데이터를 가져와서 View 에 전달합니다.
// 상태가 변하면 이를 View 에 알립니다. (상태 변화를 인지한 View 는 리빌드됩니다.)

// ChangeNotifier : 상태 변경을 알리는 클래스

import 'package:f_provider/model/CounterModel.dart';
import 'package:flutter/material.dart';

class CounterViewModel with ChangeNotifier {

  // Model 인스턴스 생성
  final CounterModel _counterModel = CounterModel();

  // getter (CounterModel 의 _count 값의 getter)
  int get count => _counterModel.count;

  // method
  void increment() {
    _counterModel.increment();  // Model 의 메소드 호출 (상태가 변경됨)
    notifyListeners();  // View 에 상태 변화를 알림
  }

  void decrement() {
    _counterModel.decrement();
    notifyListeners();
  }

  void reset() {
    _counterModel.reset();
    notifyListeners();
  }

}