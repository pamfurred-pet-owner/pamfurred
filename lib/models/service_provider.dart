class ServiceProvider {
  final int id;
  final String image;
  final String name;
  final double latitude;
  final double longitude;
  final double rating;

  ServiceProvider({
    required this.id,
    required this.image,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.rating,
  });

  // Factory method to create an instance from a map
  factory ServiceProvider.fromMap(Map<String, dynamic> map) {
    return ServiceProvider(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      rating: map['rating'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
    };
  }
}
