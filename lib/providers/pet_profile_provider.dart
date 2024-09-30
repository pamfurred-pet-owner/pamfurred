import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

// Original provider with pet profile data
final petProfileProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "pet_id": 1,
      "image": "https://tinyurl.com/5n7bu3a8",
      "pet_name": "Zara Opol",
      "pet_category": "Cat",
      "weight": 1.2,
      "age": 7,
      "sex": "Female",
      "breed": "Siamese",
      "pet_desc":
          "Zara is a charming and playful cat with a sleek, soft coat and bright, curious eyes. She has a gentle yet independent personality, often lounging in cozy spots but always ready for an adventure when something piques her interest. Zara loves chasing toys, exploring new corners, and curling up on laps for affection. Her purrs are soothing, and her presence brings warmth and joy to any room. Whether she's quietly observing or energetically playing, Zara's sweet and affectionate nature makes her a beloved companion.",
    },
    {
      "pet_id": 2,
      "image": "https://tinyurl.com/y8kxk2eh",
      "pet_name": "Buddy Jam",
      "pet_category": "Dog",
      "weight": 8.5,
      "age": 4,
      "sex": "Male",
      "breed": "Golden Retriever",
      "pet_desc":
          "Buddy is an energetic and loyal dog, always excited to play fetch or go for a run. He has a thick golden coat and a wagging tail that rarely stops moving. His playful barks are a sign of joy, and he loves being around people. Buddy is a natural protector but has a sweet, gentle side when he's relaxing at home. His friendly nature makes him the perfect companion for both outdoor adventures and cozy nights in.",
    },
    {
      "pet_id": 3,
      "image": "https://tinyurl.com/mr24m33t",
      "pet_name": "Whiskers Luna",
      "pet_category": "Cat",
      "weight": 3.1,
      "age": 5,
      "sex": "Female",
      "breed": "Tuxedo",
      "pet_desc":
          "Whiskers is a sleek and intelligent cat with a sharp sense of curiosity. She has a beautiful black-and-white coat and mesmerizing green eyes. Whiskers loves to explore every nook and cranny of the house, always searching for something new to investigate. Despite her independent nature, she enjoys snuggling up after a long day of adventures. Whiskers' playful and inquisitive personality makes her a delightful companion for those who appreciate a clever and loving pet.",
    },
    {
      "pet_id": 4,
      "image": "https://tinyurl.com/5p4wcyws",
      "pet_name": "Max Hopper",
      "pet_category": "Rabbit",
      "weight": 2.0,
      "age": 2,
      "sex": "Male",
      "breed": "Netherland Dwarf",
      "pet_desc":
          "Max is an energetic rabbit who loves to hop around in the garden and nibble on fresh greens. His soft, gray fur and big, floppy ears make him irresistibly cute. Max is a social rabbit and enjoys spending time with his owner, especially when he's being petted or given his favorite snacks. His cheerful hops and curious sniffs are a joy to watch, and his gentle temperament makes him an ideal pet for anyone who loves quiet and playful companions.",
    },
    {
      "pet_id": 5,
      "image": "https://tinyurl.com/yppwfv6m",
      "pet_name": "Milo Paws",
      "pet_category": "Rabbit",
      "weight": 1.8,
      "age": 3,
      "sex": "Male",
      "breed": "Mini Lop",
      "pet_desc":
          "Milo is a fluffy and adorable rabbit with soft white fur and floppy ears. He's shy at first but warms up quickly with gentle care and affection. Milo enjoys nibbling on fresh vegetables and hopping around in open spaces. His quiet nature is complemented by his occasional bursts of energy, where he dashes around in joyful sprints. Milo's gentle demeanor and cute appearance make him a beloved pet for those who appreciate a calm and sweet companion.",
    }
  ];
});

// FutureProvider.family to fetch a specific pet by id
final fetchPetByIdProvider =
    FutureProvider.family<Map<String, dynamic>, int>((ref, petId) async {
  // Simulate network delay
  await Future.delayed(const Duration(microseconds: 500));

  // Fetch the list of pets from the original provider
  final pets = ref.read(petProfileProvider);

  // Find the pet with the given id
  final pet =
      pets.firstWhere((pet) => pet["pet_id"] == petId, orElse: () => {});

  if (pet.isEmpty) {
    throw Exception("Pet with ID $petId not found.");
  }

  return pet;
});
