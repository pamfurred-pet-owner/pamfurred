import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import '../models/service_provider.dart';

class PgSpController extends GetxController {
  var pgSp = <ServiceProvider>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String response =
          await rootBundle.loadString('../assets/db/mock_sp_db.json');
      final data = json.decode(response);
      pgSp.value = List<ServiceProvider>.from((data['pet-grooming'] ?? [])
          .map((item) => ServiceProvider.fromMap(item)));
    } catch (e) {
      print("Error loading JSON data: $e");
    }
  }

  String getSBById(int id) {
    final sp = pgSp.firstWhere((sp) => sp.id == id,
        orElse: () => ServiceProvider(
            id: 0,
            image: '',
            name: 'Not found',
            latitude: 0,
            longitude: 0,
            rating: 0.0));
    return sp.name;
  }
}
