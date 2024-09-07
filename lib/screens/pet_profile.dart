import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/providers/pet_profile_provider.dart';
import 'package:shimmer/shimmer.dart';

class PetProfileScreen extends ConsumerWidget {
  final int petId;

  const PetProfileScreen({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPet = ref.watch(fetchPetByIdProvider(petId));

    return Scaffold(
      appBar: customAppBar(context),
      body: asyncPet.when(
        data: (pet) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: primarySizedBox),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180, // Size of the outer circle including border
                      height: 180,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red, Colors.transparent],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Image.network(
                            pet['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Display an error icon when the image fails to load
                              return Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              // Show a shimmer effect while loading
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: primarySizedBox),
                // Image.network(pet['image']),
                // const SizedBox(height: 16),
                // Text(pet['pet_name'],
                //     style: const TextStyle(
                //         fontSize: 24, fontWeight: FontWeight.bold)),
                // Text("Category: ${pet['pet_category']}",
                //     style: const TextStyle(fontSize: 16)),
                // Text("Weight: ${pet['weight']} kg",
                //     style: const TextStyle(fontSize: 16)),
                // Text("Age: ${pet['age']} years",
                //     style: const TextStyle(fontSize: 16)),
                // const SizedBox(height: 16),
                // Text(pet['pet_desc'], style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
