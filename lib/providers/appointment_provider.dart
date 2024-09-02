import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/appointment.dart'; // Import Appointment model
import '../mock_data/mock_db.dart'; // Import mock database

// StateNotifier to manage appointment state
class AppointmentNotifier extends StateNotifier<List<Appointment>> {
  AppointmentNotifier() : super([]) {
    fetchAppointments();
  }

  get appointments => null;

  // Method to fetch all appointments from the mock_db
  void fetchAppointments() {
    final List<Map<String, dynamic>> appointmentMaps = data['appointments'];

    state = appointmentMaps.map((map) {
      return Appointment.fromMap(map);
    }).toList();
  }
}

// Provider for AppointmentNotifier
final appointmentProvider =
    StateNotifierProvider<AppointmentNotifier, List<Appointment>>((ref) {
  return AppointmentNotifier();
});
