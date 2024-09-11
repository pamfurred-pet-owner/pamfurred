import 'package:flutter_riverpod/flutter_riverpod.dart';

class Service {
  const Service({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.serviceType,
    required this.petType,
  });

  final String id;
  final String name;
  final String category;
  final int price;
  final String image;
  final List<String> serviceType;
  final List<String> petType;
}

const List<Service> allServices = [
  Service(
    id: '1',
    name: 'Bath',
    category: 'pet-grooming',
    petType: ['Dog'], // List<String> expected
    price: 120,
    image: 'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    id: '2',
    name: 'Nail cut',
    category: 'pet-grooming',
    petType: ['Cat'], // List<String> expected
    price: 340,
    image: 'https://tinyurl.com/5n7bu3a8',
    serviceType: ['Home service'], // Changed to List<String>
  ),
  Service(
    id: '3',
    name: 'Toothbrush',
    category: 'pet-grooming',
    petType: ['Dog'], // List<String> expected
    price: 540,
    image: 'https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg',
    serviceType: ['Home service'], // Changed to List<String>
  ),
  Service(
    id: '4',
    name: 'X-Ray',
    category: 'veterinary-service',
    petType: ['Cat', 'Dog'], // List<String> expected
    price: 140,
    image: 'https://tinyurl.com/mtdukp3d',
    serviceType: ['In-clinic'], // Changed to List<String>
  ),
  Service(
    id: '5',
    name: 'Pet sitting',
    category: 'pet-boarding',
    petType: ['Dog'], // Added petType for consistency
    price: 290,
    image: 'https://tinyurl.com/mtk2exvk',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    id: '6',
    name: 'Haircut',
    category: 'pet-grooming',
    petType: ['Dog'], // List<String> expected
    price: 440,
    image: 'https://tinyurl.com/5n7bu3a8',
    serviceType: ['In-clinic'], // Changed to List<String>
  ),
  Service(
    id: '7',
    name: 'Hair color',
    category: 'pet-grooming',
    petType: ['Dog'], // List<String> expected
    price: 520,
    image: 'https://tinyurl.com/yppwfv6m',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    id: '8',
    name: 'Pet walking',
    category: 'pet-boarding',
    petType: ['Rabbit'], // List<String> expected
    price: 790,
    image: 'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    serviceType: ['Home service'],
  ),
];

final servicesProvider = Provider<List<Service>>((ref) {
  return allServices;
});

// Service type provider
final serviceTypeProvider = StateNotifierProvider<ServiceTypeNotifier, String>(
  (ref) => ServiceTypeNotifier(),
);

class ServiceTypeNotifier extends StateNotifier<String> {
  ServiceTypeNotifier()
      : super('Home service'); // Default value for service type

  void updateServiceType(String value) {
    print("ServiceTypeNotifier - Updated value: $value"); // Debugging line
    state = value;
  }
}

// Pet type provider
final petTypeProvider = StateNotifierProvider<PetTypeNotifier, String>(
  (ref) => PetTypeNotifier(),
);

class PetTypeNotifier extends StateNotifier<String> {
  PetTypeNotifier() : super('Dog'); // Set a valid default pet type

  void updatePetType(String value) {
    print("PetTypeNotifier - Updated value: $value"); // Debugging line
    state = value;
  }
}
