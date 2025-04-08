import 'package:hive/hive.dart';

class HiveModel {

  // nullable
  Box? _box;

  // Box 초기화
  Future<void> hiveOpenBox() async {
    _box = await Hive.openBox("myHive");
  }

  // 단일 데이터 저장
  Future<void> saveSingleData(String key, dynamic value) async {
    await _box!.put(key, value);
  }

  // 다중 데이터 저장
  Future<void> saveBulkData(Map<String, dynamic> data) async {
    await _box!.putAll(data);
  }

  // 단일 데이터 조회
  dynamic getSingleData(String key) {
    return _box!.get(key);
  }

  // 다중 데이터 조회
  Map<dynamic, dynamic> getBulkData() {
    return _box!.toMap();
  }

  // 데이터 삭제
  Future<void> deleteData(String key) async {
    await _box!.delete(key);
  }

}