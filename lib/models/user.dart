class User {
  final int userId;
  final String firstName;
  final String lastName;
  final double latitude;
  final double longitude;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.latitude,
    required this.longitude,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
