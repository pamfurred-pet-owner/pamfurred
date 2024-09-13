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
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 120,
    image: 'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    id: '2',
    name: 'Nail cut',
    category: 'Pet grooming services',
    petType: ['Cat'],
    price: 340,
    image: 'https://tinyurl.com/5n7bu3a8',
    serviceType: ['Home service'],
  ),
  Service(
    id: '3',
    name: 'Toothbrush',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 540,
    image: 'https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg',
    serviceType: ['Home service'],
  ),
  Service(
    id: '4',
    name: 'X-Ray',
    category: 'Veterinary services',
    petType: ['Cat', 'Dog'],
    price: 140,
    image: 'https://tinyurl.com/mtdukp3d',
    serviceType: ['In-clinic'],
  ),
  Service(
    id: '5',
    name: 'Pet sitting',
    category: 'Pet boarding services',
    petType: ['Dog'],
    price: 290,
    image: 'https://tinyurl.com/mtk2exvk',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    id: '6',
    name: 'Haircut',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 440,
    image: 'https://tinyurl.com/5n7bu3a8',
    serviceType: ['In-clinic'],
  ),
  Service(
    id: '7',
    name: 'Hair color',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 520,
    image: 'https://tinyurl.com/yppwfv6m',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    id: '8',
    name: 'Pet walking',
    category: 'Pet boarding services',
    petType: ['Rabbit'],
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
  ServiceTypeNotifier() : super('Home service');

  void updateServiceType(String value) {
    state = value;
  }
}

// Pet type provider
final petTypeProvider = StateNotifierProvider<PetTypeNotifier, String>(
  (ref) => PetTypeNotifier(),
);

class PetTypeNotifier extends StateNotifier<String> {
  PetTypeNotifier() : super('Dog');

  void updatePetType(String value) {
    state = value;
  }
}

// Provider to manage the list of service options
final serviceOptionsProvider = Provider<List<String>>((ref) {
  return [
    'Pet grooming services',
    'Pet boarding services',
    'Veterinary services',
  ];
});

// Provider to manage the selected service category
final selectedServiceCategoryProvider = StateProvider<String>((ref) {
  return 'Pet grooming services'; // Adjust default value if needed
});
