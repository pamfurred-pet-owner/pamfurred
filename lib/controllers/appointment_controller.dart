import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import '../models/appointment.dart';
import '../models/user.dart';
import '../models/pet.dart';

class AppointmentController extends GetxController {
  var appointments = <Appointment>[].obs;
  var users = <User>[].obs;
  var pets = <Pet>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String response =
          await rootBundle.loadString('../assets/db/mock_db.json');
      final data = json.decode(response);
      print("JSON Data Loaded: $data");

      // Load Appointments
      appointments.value = List<Appointment>.from(
        (data['appointments'] ?? []).map((item) => Appointment.fromMap(item))
      );
      print("Appointments Loaded: ${appointments.length}");

      // Load Users
      users.value = List<User>.from(
        (data['users'] ?? []).map((item) => User.fromMap(item))
      );
      print("Users Loaded: ${users.length}");

      // Load Pets
      pets.value = List<Pet>.from(
        (data['pets'] ?? []).map((item) => Pet.fromMap(item))
      );
      print("Pets Loaded: ${pets.length}");
    } catch (e) {
      print("Error loading JSON data: $e");
    }
  }
}
