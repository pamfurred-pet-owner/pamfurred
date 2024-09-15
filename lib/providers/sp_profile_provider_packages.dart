import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/providers/sp_profile_provider_services.dart';

class Package {
  const Package({
    required this.id,
    required this.name,
    required this.category,
    // required this.size,
    required this.price,
    required this.image,
    required this.packageType,
    required this.petType,
  });

  final String id;
  final String name;
  final String category;
  // final String size;
  final int price;
  final String image;
  final List<String> packageType;
  final List<String> petType;
}

const List<Package> allPackages = [
  Package(
    id: '1',
    name: 'Basic',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 120,
    image: 'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    id: '2',
    name: 'Nail cut',
    category: 'Pet grooming services',
    petType: ['Cat'],
    price: 340,
    image: 'https://tinyurl.com/5n7bu3a8',
    packageType: ['Home service'],
  ),
  Package(
    id: '3',
    name: 'Toothbrush',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 540,
    image: 'https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg',
    packageType: ['Home service'],
  ),
  Package(
    id: '4',
    name: 'X-Ray',
    category: 'Veterinary services',
    petType: ['Cat', 'Dog'],
    price: 140,
    image: 'https://tinyurl.com/mtdukp3d',
    packageType: ['In-clinic'],
  ),
  Package(
    id: '5',
    name: 'Pet sitting',
    category: 'Pet boarding services',
    petType: ['Dog'],
    price: 290,
    image: 'https://tinyurl.com/mtk2exvk',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    id: '6',
    name: 'Haircut',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 440,
    image: 'https://tinyurl.com/5n7bu3a8',
    packageType: ['In-clinic'],
  ),
  Package(
    id: '7',
    name: 'Hair color',
    category: 'Pet grooming services',
    petType: ['Dog'],
    price: 520,
    image: 'https://tinyurl.com/yppwfv6m',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    id: '8',
    name: 'Pet walking',
    category: 'Pet boarding services',
    petType: ['Rabbit'],
    price: 790,
    image: 'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    packageType: ['Home service'],
  ),
];

final packagesProvider = Provider<List<Package>>((ref) {
  return allPackages;
});

// Service type provider
final packageTypeProvider = StateNotifierProvider<PackageTypeNotifier, String>(
  (ref) => PackageTypeNotifier(),
);

class PackageTypeNotifier extends StateNotifier<String> {
  PackageTypeNotifier() : super('Home service');

  void updatePackageType(String value) {
    state = value;
  }
}

// Pet type provider
final petTypePackageProvider =
    StateNotifierProvider<PetTypePackageNotifier, String>(
  (ref) => PetTypePackageNotifier(),
);

class PetTypePackageNotifier extends StateNotifier<String> {
  PetTypePackageNotifier() : super('Dog');

  void updatePetTypePackage(String value) {
    state = value;
  }
}

// Provider to manage the list of service options
final packageOptionsProvider = Provider<List<String>>((ref) {
  return ref.watch(serviceOptionsProvider);
});

// Provider to manage the selected service category
final selectedPackageCategoryProvider = StateProvider<String>((ref) {
  return 'Pet grooming services'; // Adjust default value if needed
});
