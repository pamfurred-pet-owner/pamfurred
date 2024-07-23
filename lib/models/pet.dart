class Pet {
  final int petId;
  final String petCategory;

  Pet({
    required this.petId,
    required this.petCategory,
  });

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      petId: map['pet_id'],
      petCategory: map['pet_category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pet_id': petId,
      'pet_category': petCategory,
    };
  }
}
