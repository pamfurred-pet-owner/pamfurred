import 'package:pamfurred/models/cart_item.dart';

class Service implements CartItem {
  const Service({
    required this.serviceId,
    required this.serviceName,
    required this.category,
    required this.servicePrice,
    required this.serviceImage,
    required this.serviceType,
    required this.petType,
  });

  final String serviceId;
  final String serviceName;
  final String category;
  final int servicePrice;
  final String serviceImage;
  final List<String> serviceType;
  final List<String> petType;

  // Override the CartItem getters
  @override
  String get id => serviceId;

  @override
  int get price => servicePrice;

  @override
  String get image => serviceImage;

  @override
  String get name => serviceName;
}
