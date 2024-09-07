import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mock profile data
final profileProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {
    'username': 'chuchu143',
    'email_address': 'bobskie@gmail.com',
    'password': 'bobobob',
    'first_name': 'Bob Niño',
    'last_name': 'Golosinda',
    'phone_number': '091431431143',
    'address': 'Lapasan, Cagayan de Oro City',
  };
});