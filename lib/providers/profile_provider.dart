import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final profileProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final userId = Supabase.instance.client.auth.currentUser?.id;

  if (userId == null) {
    print('User is not authenticated.');
    return null; // If no user is logged in, return null
  }

  final response = await Supabase.instance.client
      .from('user') // Ensure this matches your table name
      .select(
          'user_id, first_name, last_name, contact_no, email_address, username')
      .eq('user_id',
          userId) // Assuming 'user_id' is the column in your 'user' table
      .single(); // Fetch a single row

  if (response.error != null) {
    print('Error fetching profile data: ${response.error!.message}');
    print('Error details: ${response.error!.hint}');
    return null;
  }

  return response.data; // Return the profile data as a map
});
