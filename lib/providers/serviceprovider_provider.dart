import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for accessing the mockDb data
final mockDbProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "sp_id": 1,
      "image":
          "https://cdn.pixabay.com/photo/2023/11/30/15/49/dog-8421955_1280.jpg",
      "name": "Paws and Claws Pet Station",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "pet-grooming",
      "packages": {
        "Bath and blow dry": {"small": 200, "medium": 300, "large": 500},
        "Nail clipping": {"small": 200, "medium": 300, "large": 500},
      },
      "services": {
        "Ears hair color": 175,
        "Tail hair color": 200,
        "Bath": {"small": 100, "medium": 200, "large": 300},
        "Toothbrush": {"small": 100, "medium": 200, "large": 300}
      }
    },
    {
      "sp_id": 2,
      "image": "",
      "name": "Purrfect Paws Grooming Spa",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "pet-grooming",
      "packages": {
        "Full Grooming": {"small": 250, "medium": 400, "large": 600},
      },
      "services": {
        "Teeth Brushing": 150,
        "Flea and Tick Treatment": 200,
        "Bath": {"small": 100, "medium": 200, "large": 300}
      }
    },
    {
      "sp_id": 3,
      "image":
          "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
      "name": "Furry Finishers Pet Salon",
      "latitude": 8.4800,
      "longitude": 124.5916,
      "rating": 0.0,
      "category": "pet-grooming",
      "packages": {
        "Basic Wash": {"small": 150, "medium": 250, "large": 400},
        "De-Shedding Treatment": {"small": 200, "medium": 300, "large": 500}
      },
      "services": {
        "Nail Trimming": 100,
      }
    },
    {
      "sp_id": 4,
      "image":
          "https://images.pexels.com/photos/6490932/pexels-photo-6490932.jpeg",
      "name": "Grooming Glitz and Glam",
      "latitude": 8.4685,
      "longitude": 124.6829,
      "rating": 4.5,
      "category": "pet-grooming",
      "packages": {
        "Luxury Grooming Package": {"small": 350, "medium": 500, "large": 700},
      },
      "services": {"Pawdicure": 180, "Ear Cleaning": 100}
    },
    {
      "sp_id": 5,
      "image":
          "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg",
      "name": "Paw-sitively Polished Pet Parlor",
      "latitude": 8.5091,
      "longitude": 124.7689,
      "rating": 4.3,
      "category": "pet-grooming",
      "packages": {
        "Haircut and Styling": {"small": 300, "medium": 450, "large": 650},
      },
      "services": {"Dental Hygiene": 250, "Skin Treatments": 300}
    },
    {
      "sp_id": 11,
      "image": "https://tinyurl.com/mtdukp3d",
      "name": "Furfection",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "pet-boarding",
      "packages": {
        "Overnight Stay": {"small": 500, "medium": 700, "large": 900},
        "Daycare": {"small": 200, "medium": 300, "large": 400},
      },
      "services": {"Feeding Service": 100}
    },
    {
      "sp_id": 12,
      "image": "https://tinyurl.com/mtk2exvk",
      "name": "Paws & Paradise Retreat",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "pet-boarding",
      "packages": {
        "Luxury Suite": {"small": 800, "medium": 1000, "large": 1200},
      },
      "services": {"Daily Walks": 150, "Medication Administration": 200}
    },
    {
      "sp_id": 21,
      "image": "https://tinyurl.com/5n7bu3a8",
      "name": "Healthy Paws Veterinary",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "veterinary-service",
      "packages": {
        "Vaccination": {"dog": 500, "cat": 400},
        "Emergency Care": {"basic": 1000, "advanced": 2000}
      },
      "services": {
        "Health Check-up": 300,
      }
    },
    {
      "sp_id": 22,
      "image": "https://tinyurl.com/yppwfv6m",
      "name": "Whiskers & Wellness Vet",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "veterinary-service",
      "packages": {
        "Spay/Neuter": {"dog": 1500, "cat": 1200},
      },
      "services": {"X-ray": 800, "Dental Cleaning": 500}
    },
    {
      "sp_id": 23,
      "image":
          "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
      "name": "TailCare Animal Clinic",
      "latitude": 8.4800,
      "longitude": 124.5916,
      "rating": 0.0,
      "category": "veterinary-service"
    },
    {
      "sp_id": 24,
      "image":
          "https://images.pexels.com/photos/6490932/pexels-photo-6490932.jpeg",
      "name": "PawPath Veterinary Services",
      "latitude": 8.4685,
      "longitude": 124.6829,
      "rating": 4.5,
      "category": "veterinary-service"
    },
    {
      "sp_id": 25,
      "image":
          "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg",
      "name": "Furry Friends Vet Clinic",
      "latitude": 8.5091,
      "longitude": 124.7689,
      "rating": 4.3,
      "category": "veterinary-service"
    },
    {
      "sp_id": 26,
      "image":
          "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg",
      "name": "PetPulse Animal Health",
      "latitude": 8.4851,
      "longitude": 124.7492,
      "rating": 4.1,
      "category": "veterinary-service"
    },
    {
      "sp_id": 27,
      "image":
          "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg",
      "name": "Pawsitive Vets",
      "latitude": 8.4896,
      "longitude": 124.6576,
      "rating": 4.5,
      "category": "veterinary-service"
    },
    {
      "sp_id": 28,
      "image":
          "https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg",
      "name": "Whiskers & Wags Animal Care",
      "latitude": 8.4655,
      "longitude": 124.7354,
      "rating": 4.4,
      "category": "veterinary-service"
    },
    {
      "sp_id": 29,
      "image":
          "https://images.pexels.com/photos/1472999/pexels-photo-1472999.jpeg",
      "name": "VetVital Pet Clinic",
      "latitude": 8.4795,
      "longitude": 124.6663,
      "rating": 4.3,
      "category": "veterinary-service"
    },
    {
      "sp_id": 30,
      "image":
          "https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg",
      "name": "The Pet Wellness Hub",
      "latitude": 8.4606,
      "longitude": 124.7830,
      "rating": 4.5,
      "category": "veterinary-service"
    },
  ];
});
// Provider for fetching packages
final packagesProvider = Provider<Map<String, dynamic>>((ref) {
  final mockDb = ref.watch(mockDbProvider);
  final packages = <String, dynamic>{};

  for (var serviceProvider in mockDb) {
    if (serviceProvider.containsKey('packages')) {
      packages[serviceProvider['name']] = serviceProvider['packages'];
    }
  }

  return packages;
});

// Provider for fetching services
final servicesProvider = Provider<Map<String, dynamic>>((ref) {
  final mockDb = ref.watch(mockDbProvider);
  final services = <String, dynamic>{};

  for (var serviceProvider in mockDb) {
    if (serviceProvider.containsKey('services')) {
      services[serviceProvider['name']] = serviceProvider['services'];
    }
  }

  return services;
});
