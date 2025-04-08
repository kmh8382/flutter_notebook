import 'package:flutter/material.dart';
import 'package:j_hive_provider/view/ButtonWidget.dart';
import 'package:j_hive_provider/viewmodel/HiveViewModel.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HiveState();
}

class _HiveState extends State<HiveScreen> {

  // 상태
  bool _isOpened = false;

  final HiveViewModel _viewModel = HiveViewModel();

  // 초기화
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  // HiveViewModel 의 initialize() 메소드를 호출하는 메소드
  Future<void> _initialize() async {
    await _viewModel.initialize();
    setState(() {
      _isOpened = true;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive and Provider"),
      ),
      body: _isOpened ? ButtonWidget(viewModel: _viewModel) : Center(child: const CircularProgressIndicator()),
    );

  }

}