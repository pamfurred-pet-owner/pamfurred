// providers.dart
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
      "category": "pet-grooming"
    },
    {
      "sp_id": 2,
      "image": "",
      "name": "Purrfect Paws Grooming Spa",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "pet-grooming"
    },
    {
      "sp_id": 3,
      "image":
          "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
      "name": "Furry Finishers Pet Salon",
      "latitude": 8.4800,
      "longitude": 124.5916,
      "rating": 0.0,
      "category": "pet-grooming"
    },
    {
      "sp_id": 4,
      "image":
          "https://images.pexels.com/photos/6490932/pexels-photo-6490932.jpeg",
      "name": "Grooming Glitz and Glam",
      "latitude": 8.4685,
      "longitude": 124.6829,
      "rating": 4.5,
      "category": "pet-grooming"
    },
    {
      "sp_id": 5,
      "image":
          "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg",
      "name": "Paw-sitively Polished Pet Parlor",
      "latitude": 8.5091,
      "longitude": 124.7689,
      "rating": 4.3,
      "category": "pet-grooming"
    },
    {
      "sp_id": 6,
      "image":
          "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg",
      "name": "Snip 'n Shine Pet Retreat",
      "latitude": 8.4851,
      "longitude": 124.7492,
      "rating": 4.1,
      "category": "pet-grooming"
    },
    {
      "sp_id": 7,
      "image":
          "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg",
      "name": "Mane Attraction Pet Grooming",
      "latitude": 8.4896,
      "longitude": 124.6576,
      "rating": 4.5,
      "category": "pet-grooming"
    },
    {
      "sp_id": 8,
      "image":
          "https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg",
      "name": "Tailored Tails Pet Grooming Services",
      "latitude": 8.4655,
      "longitude": 124.7354,
      "rating": 4.4,
      "category": "pet-grooming"
    },
    {
      "sp_id": 9,
      "image":
          "https://images.pexels.com/photos/1472999/pexels-photo-1472999.jpeg",
      "name": "Fuzzy Finish Pet Salon",
      "latitude": 8.4795,
      "longitude": 124.6663,
      "rating": 4.3,
      "category": "pet-grooming"
    },
    {
      "sp_id": 10,
      "image":
          "https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg",
      "name": "Critter Care Grooming Services",
      "latitude": 8.4606,
      "longitude": 124.7830,
      "rating": 4.5,
      "category": "pet-grooming"
    },
    {
      "sp_id": 11,
      "image": "https://tinyurl.com/mtdukp3d",
      "name": "Furfection",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "pet-boarding"
    },
    {
      "sp_id": 12,
      "image": "https://tinyurl.com/mtk2exvk",
      "name": "Paws & Paradise Retreat",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "pet-boarding"
    },
    {
      "sp_id": 13,
      "image":
          "https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg",
      "name": "Furry Haven Boarding",
      "latitude": 8.4800,
      "longitude": 124.5916,
      "rating": 0.0,
      "category": "pet-boarding"
    },
    {
      "sp_id": 14,
      "image":
          "https://images.pexels.com/photos/6490932/pexels-photo-6490932.jpeg",
      "name": "Whiskers & Wag Resort",
      "latitude": 8.4685,
      "longitude": 124.6829,
      "rating": 4.5,
      "category": "pet-boarding"
    },
    {
      "sp_id": 15,
      "image":
          "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg",
      "name": "Pup & Purr Lodge",
      "latitude": 8.5091,
      "longitude": 124.7689,
      "rating": 4.3,
      "category": "pet-boarding"
    },
    {
      "sp_id": 16,
      "image":
          "https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg",
      "name": "Tailwind Pet Staycation",
      "latitude": 8.4851,
      "longitude": 124.7492,
      "rating": 4.1,
      "category": "pet-boarding"
    },
    {
      "sp_id": 17,
      "image":
          "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg",
      "name": "The Cozy Critter Inn",
      "latitude": 8.4896,
      "longitude": 124.6576,
      "rating": 4.5,
      "category": "pet-boarding"
    },
    {
      "sp_id": 18,
      "image":
          "https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg",
      "name": "Fur & Feathers Boarding",
      "latitude": 8.4655,
      "longitude": 124.7354,
      "rating": 4.4,
      "category": "pet-boarding"
    },
    {
      "sp_id": 19,
      "image":
          "https://images.pexels.com/photos/1472999/pexels-photo-1472999.jpeg",
      "name": "Barks & Naps Retreat",
      "latitude": 8.4795,
      "longitude": 124.6663,
      "rating": 4.3,
      "category": "pet-boarding"
    },
    {
      "sp_id": 20,
      "image":
          "https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg",
      "name": "Pawsitive Stay Resort",
      "latitude": 8.4606,
      "longitude": 124.7830,
      "rating": 4.5,
      "category": "pet-boarding"
    },
    {
      "sp_id": 21,
      "image": "https://tinyurl.com/5n7bu3a8",
      "name": "Healthy Paws Veterinary",
      "latitude": 8.1920,
      "longitude": 124.0850,
      "rating": 4.5,
      "category": "veterinary-service"
    },
    {
      "sp_id": 22,
      "image": "https://tinyurl.com/yppwfv6m",
      "name": "Whiskers & Wellness Vet",
      "latitude": 8.4770,
      "longitude": 124.6501,
      "rating": 4.3,
      "category": "veterinary-service"
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
