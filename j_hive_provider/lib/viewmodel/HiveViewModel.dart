import 'package:j_hive_provider/model/HiveModel.dart';

class HiveViewModel {

  final HiveModel _hiveModel = HiveModel();

  // 초기화
  Future<void> initialize() async {
    await _hiveModel.hiveOpenBox();
  }

  // 단일 데이터 저장
  Future<void> registData(String key, dynamic value) async {
    await _hiveModel.saveSingleData(key, value);
  }

  // 다중 데이터 저장
  Future<void> registBulkData(Map<String, dynamic> data) async {
    await _hiveModel.saveBulkData(data);
  }

  // 단일 데이터 조회
  dynamic getData(String key) {
    return _hiveModel.getSingleData(key);
  }

  // 다중 데이터 조회
  Map<dynamic, dynamic> getAllData() {
    return _hiveModel.getBulkData();
  }

  // 데이터 삭제
  Future<void> deleteData(String key) async {
    await _hiveModel.deleteData(key);
  }

}