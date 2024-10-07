import 'package:flutter_riverpod/flutter_riverpod.dart';

final mockDbProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "sp_id": 1,
      "image":
          "https://scontent.fmnl25-2.fna.fbcdn.net/v/t39.30808-6/303383610_451807140302013_8347004728886342413_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFdwN-UdOPvFGaR0fzTPGAL5ZkDFMSFixblmQMUxIWLFtzeMtRnz8FpQtIJyXJsdFxVhE0pX9hSoi4H2HxwYA1W&_nc_ohc=8JWvA2Y7z_wQ7kNvgEGap0T&_nc_ht=scontent.fmnl25-2.fna&_nc_gid=AEozISPsKFFOBvLvsb-3VGD&oh=00_AYApCD-bAvevNu5ch9TAG5naheHYqDRkzIc5xrJ7W1lBbg&oe=66EA06FD",
      "name": "Golden Pet Veterinary Clinic",
      "address": "Iponan, Cagayan de Oro City",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "Pet grooming",
      "phone": "+63 917 123 4567",
      "hours": "9 am - 5 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic, Home service",
    },
    {
      "sp_id": 2,
      "image": "",
      "name": "Purrfect Paws Grooming Spa",
      "address": "Divisoria, Cagayan de Oro City",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "Pet grooming",
      "phone": "+63 917 234 5678",
      "hours": "10 am - 6 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic",
    },
    {
      "sp_id": 3,
      "image":
          "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
      "name": "Furry Finishers Pet Salon",
      "address": "Agusan, Cagayan de Oro City",
      "latitude": 8.4800,
      "longitude": 124.5916,
      "rating": 0.0,
      "category": "Pet grooming",
      "phone": "+63 917 345 6789",
      "hours": "8 am - 4 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "Home service",
    },
    {
      "sp_id": 4,
      "image":
          "https://images.pexels.com/photos/6490932/pexels-photo-6490932.jpeg",
      "name": "Grooming Glitz and Glam",
      "address": "Cogon, Cagayan de Oro City",
      "latitude": 8.4685,
      "longitude": 124.6829,
      "rating": 4.5,
      "category": "Pet grooming",
      "phone": "+63 917 456 7890",
      "hours": "9 am - 5 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic, Home service",
    },
    {
      "sp_id": 5,
      "image":
          "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg",
      "name": "Paw-sitively Polished Pet Parlor",
      "address": "Cugman, Cagayan de Oro City",
      "latitude": 8.5091,
      "longitude": 124.7689,
      "rating": 4.3,
      "category": "Pet grooming",
      "phone": "+63 917 567 8901",
      "hours": "10 am - 6 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic",
    },
    {
      "sp_id": 11,
      "image": "https://tinyurl.com/mtdukp3d",
      "name": "Furfection",
      "address": "Gusa, Cagayan de Oro City",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "Pet boarding",
      "phone": "+63 917 678 9012",
      "hours": "9 am - 5 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic, Home service",
    },
    {
      "sp_id": 12,
      "image": "https://tinyurl.com/mtk2exvk",
      "name": "Paws & Paradise Retreat",
      "address": "Lapasan, Cagayan de Oro City",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "Pet boarding",
      "phone": "+63 917 789 0123",
      "hours": "8 am - 4 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic",
    },
    {
      "sp_id": 21,
      "image": "https://tinyurl.com/5n7bu3a8",
      "name": "Healthy Paws Veterinary",
      "address": "Gusa, Cagayan de Oro City",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "Veterinary service",
      "phone": "+63 917 890 1234",
      "hours": "9 am - 5 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic, Home service",
    },
    {
      "sp_id": 22,
      "image": "https://tinyurl.com/yppwfv6m",
      "name": "Whiskers & Wellness Vet",
      "address": "Gusa, Cagayan de Oro City",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "Veterinary service",
      "phone": "+63 917 901 2345",
      "hours": "8 am - 6 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic",
    },
    {
      "sp_id": 23,
      "image":
          "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
      "name": "TailCare Animal Clinic",
      "address": "Lapasan, Cagayan de Oro City",
      "latitude": 8.4800,
      "longitude": 124.5916,
      "rating": 0.0,
      "category": "Veterinary service",
      "phone": "+63 917 012 3456",
      "hours": "9 am - 5 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic",
    },
    {
      "sp_id": 24,
      "image":
          "https://images.pexels.com/photos/6490932/pexels-photo-6490932.jpeg",
      "name": "PawPath Veterinary services",
      "address": "Bugo, Cagayan de Oro City",
      "latitude": 8.4685,
      "longitude": 124.6829,
      "rating": 4.5,
      "category": "Veterinary service",
      "phone": "+63 917 123 4567",
      "hours": "8 am - 6 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic, Home service",
    },
    {
      "sp_id": 25,
      "image":
          "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg",
      "name": "Furry Friends Vet Clinic",
      "address": "Tablon, Cagayan de Oro City",
      "latitude": 8.5091,
      "longitude": 124.7689,
      "rating": 4.3,
      "category": "Veterinary service",
      "phone": "+63 917 234 5678",
      "hours": "10 am - 4 pm",
      "pets_catered": "Caters dogs, cats, and bunnies",
      "service_type": "In-clinic",
    }
  ];
});

// Provider to manage the selected service provider for booking appointment
final selectedSpIndexProvider = StateProvider<String>((ref) => '');

final spIndexProvider = Provider<Map<String, dynamic>>((ref) {
  final allItems = ref.watch(mockDbProvider);

  final selectedSp = ref.watch(selectedSpIndexProvider);

  // Find the service provider with the matching sp_id
  return allItems.firstWhere((item) => item['sp_id'].toString() == selectedSp);
});
