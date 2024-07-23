class Appointment {
  final int appointmentId;
  final int userId;
  final int spID;
  final int petId;
  final int appointmentItemId;
  final String appointmentDate;
  final String appointmentTime;
  final String status;
  final double totalAmount;

  Appointment({
    required this.appointmentId,
    required this.userId,
    required this.spID,
    required this.petId,
    required this.appointmentItemId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.status,
    required this.totalAmount,
  });

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      appointmentId: map['appointment_id'],
      userId: map['user_id'],
      spID: map['sp_id'],
      petId: map['pet_id'],
      appointmentItemId: map['appointment_item_id'],
      appointmentDate: map['appointment_date'],
      appointmentTime: map['appointment_time'],
      status: map['status'],
      totalAmount: map['total_amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appointment_id': appointmentId,
      'user_id': userId,
      'sp_id': spID,
      'pet_id': petId,
      'appointment_item_id': appointmentItemId,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
      'status': status,
      'total_amount': totalAmount,
    };
  }
}
