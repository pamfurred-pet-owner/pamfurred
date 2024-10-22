import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_package;

final supabase = supabase_package.Supabase.instance.client;

Future<List<Map<String, dynamic>>> fetchDataFromSupabase() async {
  final response = await supabase.from('service_provider').select();
  if (response.error != null) {
    throw response.error!;
  }
  return response.data as List<Map<String, dynamic>>;
}

final dataProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  try {
    final data = await fetchDataFromSupabase();
    return data;
  } catch (e) {
    throw Exception('Failed to fetch data from Supabase: $e');
  }
});

// Provider to manage the selected service provider for booking appointment
final selectedSpIndexProvider = StateProvider<String>((ref) => '');

final spIndexProvider = Provider<Map<String, dynamic>>((ref) {
  final allItems = ref.watch(dataProvider);

  final selectedSp = ref.watch(selectedSpIndexProvider);

  return allItems.maybeWhen(
    data: (data) {
      // Only search for the selected item when data is available
      return data.firstWhere(
        (item) => item['sp_id'].toString() == selectedSp,
        orElse: () => <String, dynamic>{},
      );
    },
    orElse: () => <String, dynamic>{},
  );
});
