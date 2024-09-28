import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/models/packages.dart';
import 'package:pamfurred/providers/sp_profile_provider_services.dart';

const List<Package> allPackages = [
  Package(
    packageId: '9',
    packageName: 'Small',
    category: 'Pet grooming services',
    minSize: 0,
    maxSize: 5,
    petType: ['Dog'],
    packagePrice: 120,
    packageImage:
        'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    packageId: '10',
    packageName: 'Medium',
    category: 'Pet grooming services',
    minSize: 6,
    maxSize: 10,
    petType: ['Cat'],
    packagePrice: 340,
    packageImage: 'https://tinyurl.com/5n7bu3a8',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    packageId: '11',
    packageName: 'Large',
    category: 'Pet grooming services',
    minSize: 11,
    maxSize: 15,
    petType: ['Dog'],
    packagePrice: 540,
    packageImage:
        'https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    packageId: '12',
    packageName: 'Extra large',
    category: 'Pet grooming services',
    minSize: 16,
    maxSize: "Greater than or equal to the minimum size",
    petType: ['Dog'],
    packagePrice: 440,
    packageImage: 'https://tinyurl.com/5n7bu3a8',
    packageType: ['In-clinic'],
  ),
  Package(
    packageId: '13',
    packageName: 'Small',
    category: 'Veterinary services',
    minSize: 0,
    maxSize: 5,
    petType: ['Cat', 'Dog'],
    packagePrice: 140,
    packageImage: 'https://tinyurl.com/mtdukp3d',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    packageId: '14',
    packageName: 'Medium',
    category: 'Pet boarding services',
    minSize: 6,
    maxSize: 10,
    petType: ['Dog'],
    packagePrice: 290,
    packageImage: 'https://tinyurl.com/mtk2exvk',
    packageType: ['Home service', 'In-clinic'],
  ),
  Package(
    packageId: '15',
    packageName: 'Large',
    category: 'Pet boarding services',
    minSize: 11,
    maxSize: 15,
    petType: ['Rabbit'],
    packagePrice: 790,
    packageImage:
        'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg',
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
