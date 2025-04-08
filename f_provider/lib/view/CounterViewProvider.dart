// View
// UI를 담당합니다.
// ViewModel 에서 제공하는 데이터를 이용해 UI를 구성합니다.
// 상태 관리는 ViewModel 이 담당합니다.

import 'package:f_provider/viewmodel/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterViewProvider extends StatelessWidget {

  const CounterViewProvider({super.key});

  @override
  Widget build(BuildContext context) {

    // Provider 인스턴스 생성
    // ViewModel 이 제공하는 상태 값을 제공하는 역할
    final CounterViewModel provider = Provider.of<CounterViewModel>(context);

    // 상태 count 가 변하면 전체 UI 가 리빌드 됩니다.
    // 이러한 비효율을 개선하기 위해서 Consumer 를 사용할 수 있습니다.
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Pattern Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Provider 를 이용한 상태 확인
            Text("현재 Count = ${provider.count}", style: TextStyle(fontSize: 32),),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Provider 를 이용한 상태 변경
                ElevatedButton(onPressed: provider.increment, child: const Text("+")),
                ElevatedButton(onPressed: provider.decrement, child: const Text("-")),
                ElevatedButton(onPressed: provider.reset, child: const Text("reset")),
              ],
            )
          ],
        ),
      ),
    );

  }

}