import 'package:f_provider/view/CounterViewConsumer.dart';
import 'package:f_provider/view/CounterViewProvider.dart';
import 'package:f_provider/viewmodel/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// MVVM Pattern (Model - View - ViewModel)
// 1. Model
//    데이터 정의, 데이터 변경 메소드 제공, 데이터 소스 관련 로직 (데이터베이스, API 호출 등)
// 2. View
//    UI 구성, Provider 를 이용해 ViewModel 에 접근 (View 가 직접 Model 에 접근하지 않도록 주의)
// 3. ViewModel
//    Model 인스턴스 포함, ChangeNotifier 와 함께 notifyListeners() 메소드 호출

// ChangeNotifierProvider
// ViewModel 을 앱 전체에 제공하는 역할을 수행합니다. (ViewModel 과 View 의 연결)
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => CounterViewModel(),  // ViewModel 등록
      // create: (_) => CounterViewModel(),  // 매개변수 _ : 매개변수가 필요하지만 사용하지 않을 때
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
        // const CounterViewProvider(),
        const CounterViewConsumer(),
    );
  }

}