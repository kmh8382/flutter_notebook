// Consumer
// Consumer 는 ViewModel 의 상태를 감시합니다.
// 상태가 변경될때마다 Consumer 의 builder() 함수가 호출되고, 이 builder() 함수 부분만 리빌드 됩니다.
// 전체 위젯 트리가 리빌드 되는 방식이 아니므로 성능이 향상될 수 있습니다.

import 'package:f_provider/viewmodel/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterViewConsumer extends StatelessWidget {

  const CounterViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Pattern Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer 사용으로 count 값이 변경되면 builder() 가 반환하는 부분이 리빌드 됨
            Consumer<CounterViewModel>(
              builder: (BuildContext context, CounterViewModel provider, Widget? child) {
                return Text("현재 Count = ${provider.count}", style: TextStyle(fontSize: 32),);
              },
            ),
            SizedBox(height: 20),
            Consumer<CounterViewModel>(
              builder: (BuildContext context, CounterViewModel provider, Widget? child) {
                return
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // BuildContext 를 이용해 ViewModel (provider) 에 접근하기
                      ElevatedButton(
                        onPressed: () {
                          CounterViewModel provider = context.read<CounterViewModel>();
                          provider.increment();
                        },
                        child: const Text("+")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterViewModel>().decrement();
                        },
                        child: const Text("-")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterViewModel>().reset();
                        },
                        child: const Text("Reset")
                      ),
                    ],
                  );
              }
            ),
          ],
        ),
      ),
    );
    */

    // builder() 의 child 활용하기
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Pattern Counter"),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, CounterViewModel provider, Widget? child) {
            return
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("현재 Count = ${provider.count}",
                    style: TextStyle(fontSize: 32),),
                  SizedBox(height: 20),
                  child ?? Text(""),  // child!
                ],
              );
          },
          child: const _ButtonWidget(),  // builder() 함수의 3번째 매개변수 Widget? child 로 전달
        ),
      ),
    );
  }

}

class _ButtonWidget extends StatelessWidget {

  const _ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // BuildContext 를 이용한 ViewModel 접근
        ElevatedButton(onPressed: () { context.read<CounterViewModel>().increment(); }, child: const Text("+")),
        ElevatedButton(onPressed: () { context.read<CounterViewModel>().decrement(); }, child: const Text("-")),
        ElevatedButton(onPressed: () { context.read<CounterViewModel>().reset(); }, child: const Text("reset")),
      ],
    );
  }

}