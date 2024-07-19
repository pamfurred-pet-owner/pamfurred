import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class PgSpController extends GetxController {
  var pgSp = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/mock_sp_db.json');
      final data = json.decode(response);
      pgSp.value = List<Map<String, dynamic>>.from(data['pet-grooming'] ?? []);
    } catch (e) {
      print("Error loading JSON data: $e");
    }
  }

  String getSBById(int id) {
    final sp = pgSp.firstWhere((sp) => sp['id'] == id, orElse: () => {});
    return sp.isNotEmpty ? sp['name'] : 'Service provider not found';
  }
}
