import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HiveState();
}

class _HiveState extends State<HiveScreen> {

  // nullable box
  Box? box;

  // 상태 초기화
  @override
  void initState() {
    super.initState();
    _openHiveBox();  // Box 열기
  }

  // Box 를 여는 메소드
  Future<void> _openHiveBox() async {
    box = await Hive.openBox("myHive");
    setState(() {
      // Box 가 열리면 UI 업데이트
    });
  }

  // Box 기반 데이터베이스 조작 (데이터는 key/value 조합으로 구성)
  // put(), putAll() : 저장
  // get() : 조회
  // delete() : 삭제

  // UI 빌드
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            box == null ? const CircularProgressIndicator() : const Text("Hive Box is opened"),
            ElevatedButton(
              onPressed: () {
                box!.put("spring", "봄");
              },
              child: const Text("단일 데이터 저장")
            ),
            ElevatedButton(
              onPressed: () {
                Map<String, String> dict = {
                  "summer": "여름",
                  "autumn": "가을",
                  "winter": "겨울",
                };
                box!.putAll(dict);
              },
              child: const Text("다중 데이터 저장")
            ),
            ElevatedButton(
              onPressed: () {
                final String value = box!.get("spring");
                print(value);
              },
              child: const Text("단일 데이터 조회")
            ),
            ElevatedButton(
              onPressed: () {
                final int length = box!.length;  // 저장된 데이터의 개수
                final values = box!.values;      // 저장된 values
                final keys = box!.keys;          // 저장된 keys
                print("length = $length");
                print("values = $values");
                print("keys = $keys");
              },
              child: const Text("다중 데이터 조회")
            ),
            ElevatedButton(
              onPressed: () {
                box!.delete("winter");
              },
              child: const Text("단일 데이터 삭제")
            ),
          ],
        ),
      ),
    );

  }

}