import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/models/services.dart';

const List<Service> allServices = [
  Service(
    serviceId: '1',
    serviceName: 'Bath',
    category: 'Pet grooming services',
    petType: ['Dog'],
    servicePrice: 120,
    serviceImage:
        'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    serviceId: '2',
    serviceName: 'Nail cut',
    category: 'Pet grooming services',
    petType: ['Cat'],
    servicePrice: 340,
    serviceImage: 'https://tinyurl.com/5n7bu3a8',
    serviceType: ['Home service'],
  ),
  Service(
    serviceId: '3',
    serviceName: 'Toothbrush',
    category: 'Pet grooming services',
    petType: ['Dog'],
    servicePrice: 540,
    serviceImage:
        'https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg',
    serviceType: ['Home service'],
  ),
  Service(
    serviceId: '4',
    serviceName: 'X-Ray',
    category: 'Veterinary services',
    petType: ['Cat', 'Dog'],
    servicePrice: 140,
    serviceImage: 'https://tinyurl.com/mtdukp3d',
    serviceType: ['In-clinic'],
  ),
  Service(
    serviceId: '5',
    serviceName: 'Pet sitting',
    category: 'Pet boarding services',
    petType: ['Dog'],
    servicePrice: 290,
    serviceImage: 'https://tinyurl.com/mtk2exvk',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    serviceId: '6',
    serviceName: 'Haircut',
    category: 'Pet grooming services',
    petType: ['Dog'],
    servicePrice: 440,
    serviceImage: 'https://tinyurl.com/5n7bu3a8',
    serviceType: ['In-clinic'],
  ),
  Service(
    serviceId: '7',
    serviceName: 'Hair color',
    category: 'Pet grooming services',
    petType: ['Dog'],
    servicePrice: 520,
    serviceImage: 'https://tinyurl.com/yppwfv6m',
    serviceType: ['Home service', 'In-clinic'],
  ),
  Service(
    serviceId: '8',
    serviceName: 'Pet walking',
    category: 'Pet boarding services',
    petType: ['Rabbit'],
    servicePrice: 790,
    serviceImage:
        'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
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
    'All'
  ];
});

// Provider to manage the selected service category
final selectedServiceCategoryProvider = StateProvider<String>((ref) {
  return 'All'; // Adjust default value if needed
});
