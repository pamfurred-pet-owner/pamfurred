import 'package:flutter_riverpod/flutter_riverpod.dart';

final mockDbProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "sp_id": 1,
      "image": "https://tinyurl.com/yxxv7523",
      "name": "Paws and Claws Pet Station",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "packages": {
        "Bath and blow dry": {
          "small": {
            "service_image":
                "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
            "Price": 200
          },
          "medium": {
            "service_image":
                "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
            "Price": 300
          },
          "large": {
            "service_image":
                "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
            "Price": 500
          },
          "category": "pet-grooming"
        },
        "Nail clipping": {
          "small": 200,
          "medium": 300,
          "large": 500,
          "category": "pet-grooming"
        },
      },
      "services": {
        "Ears hair color": {"category": "pet-grooming", "price": 175},
        "Tail hair color": {"category": "pet-grooming", "price": 200},
        "Bath": {
          "small": 100,
          "medium": 200,
          "large": 300,
          "category": "pet-grooming"
        },
        "Toothbrush": {
          "small": 100,
          "medium": 200,
          "large": 300,
          "category": "pet-grooming"
        }
      }
    }
  ];
});

// Provider for formatted service details with sizes and prices
final formattedServiceDetailsProvider =
    Provider.family<Map<String, List<String>>, String>((ref, category) {
  final mockDb = ref.watch(mockDbProvider);

  final formattedServices = <String, List<String>>{};
  for (var serviceProvider in mockDb) {
    final services = serviceProvider["services"] as Map<String, dynamic>;

    services.forEach((serviceName, serviceDetails) {
      if (serviceDetails['category'] == category) {
        final sizes = ["small", "medium", "large"];
        final formattedList = <String>[];

        for (var size in sizes) {
          // Ensure the size exists in serviceDetails and is a number
          if (serviceDetails.containsKey(size) && serviceDetails[size] is num) {
            formattedList.add(
                "$serviceName, ${capitalize(size)}, ₱${serviceDetails[size]}");
          }
        }

        // If the service doesn't have sizes, include the price
        if (formattedList.isEmpty) {
          final price = serviceDetails['price'];
          if (price is num) {
            formattedList.add("$serviceName, Price: ₱$price");
          }
        }

        formattedServices[serviceName] = formattedList;
      }
    });
  }
  return formattedServices;
});

// Helper function to capitalize the first letter
String capitalize(String word) {
  return "${word[0].toUpperCase()}${word.substring(1)}";
}

// Provider for accessing packages by category
final packagesByCategoryProvider =
    Provider.family<Map<String, Map<String, dynamic>>, String>((ref, category) {
  final mockDb = ref.watch(mockDbProvider);

  final packages = <String, Map<String, dynamic>>{};
  for (var serviceProvider in mockDb) {
    final packagesData = serviceProvider["packages"] as Map<String, dynamic>;

    packagesData.forEach((packageName, packageDetails) {
      if (packageDetails['category'] == category) {
        packages[packageName] = packageDetails;
      }
    });
  }
  return packages;
});
