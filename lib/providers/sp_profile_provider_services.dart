import 'package:flutter_riverpod/flutter_riverpod.dart';

class Service {
  const Service(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.image});

  final String id;
  final String name;
  final String category;
  final int price;
  final String image;
}

const List<Service> allServices = [
  Service(
      id: '1',
      name: 'Bath',
      category: 'pet-grooming',
      price: 120,
      image:
          'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg'),
  Service(
      id: '2',
      name: 'Nail cut',
      category: 'pet-grooming',
      price: 340,
      image:
          'https://tinyurl.com/5n7bu3a8'),
  Service(
      id: '3',
      name: 'Toothbrush',
      category: 'pet-grooming',
      price: 540,
      image:
          'https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg'),
  Service(
      id: '4',
      name: 'X-Ray',
      category: 'veterinary-service',
      price: 140,
      image: 'https://tinyurl.com/mtdukp3d'),
  Service(
      id: '5',
      name: 'Pet sitting',
      category: 'pet-boarding',
      price: 290,
      image: 'https://tinyurl.com/mtk2exvk'),
  Service(
      id: '6',
      name: 'Haircut',
      category: 'pet-grooming',
      price: 440,
      image: 'https://tinyurl.com/5n7bu3a8'),
  Service(
      id: '7',
      name: 'Hair color',
      category: 'pet-grooming',
      price: 520,
      image: 'https://tinyurl.com/yppwfv6m'),
  Service(
      id: '8',
      name: 'Pet walking',
      category: 'pet-boarding',
      price: 790,
      image:
          'https://images.pexels.com/photos/1632061/pexels-photo-1632061.jpeg'),
];

final servicesProvider = Provider<List<Service>>((ref) {
  return allServices;
});
