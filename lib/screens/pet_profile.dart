import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/pet_profile_provider.dart';

class PetProfileScreen extends ConsumerWidget {
  final int petId;

  const PetProfileScreen({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPet = ref.watch(fetchPetByIdProvider(petId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context),
      body: asyncPet.when(
        data: (pet) {
          const double descWidth = 331;
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: screenPadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: primarySizedBox),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                  0.1), // Space for the gradient border
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [primaryColor, Colors.transparent],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.25, 0.9]),
                              ),
                              child: Card(
                                shape: const CircleBorder(),
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      secondarySizedBox), // Space between image and card border
                                  child: ClipOval(
                                    child: Image.network(
                                      pet['image'], // Replace with your image URL
                                      fit: BoxFit.cover,
                                      width: 151,
                                      height: 151,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                right: 0,
                                child: SizedBox(
                                  height: 32,
                                  child: CircleAvatar(
                                    backgroundColor: primaryColor,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: tertiarySizedBox),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customTitleText(context, pet['pet_name']),
                        const SizedBox(
                          width: secondarySizedBox,
                        ),
                        editIcon(),
                      ],
                    ),
                    const SizedBox(height: tertiarySizedBox),
                    // TODO: Add area for pet breed
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      petDesc(context, pet['age'].toString(), "mos. old"),
                      verticalDivider(),
                      petDesc(context, pet['pet_category'], "category"),
                      verticalDivider(),
                      petDesc(context, pet['weight'].toString(), "kg."),
                      const SizedBox(width: tertiarySizedBox),
                      editIcon()
                    ]),
                    const SizedBox(height: tertiarySizedBox),
                    SizedBox(
                      width: descWidth + 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTitleText(context, 'About ${pet['pet_name']}'),
                          editIcon()
                        ],
                      ),
                    ),
                    const SizedBox(height: tertiarySizedBox),
                    Center(
                      child: SizedBox(
                        width: descWidth,
                        child: Text(pet['pet_desc'],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                color: darkGreyColor, fontSize: regularText)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }

  subtitleText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: darkGreyColor,
          fontSize: regularText,
          fontWeight: regularWeight),
    );
  }

  verticalDivider() {
    return Container(
      width: 1, // Width of the divider
      height: 33, // Height of the divider
      color: Colors.black, // Line color
      margin: const EdgeInsets.symmetric(
          horizontal:
              quaternarySizedBox), // Space between divider and adjacent elements
    );
  }

  petDesc(BuildContext context, String petDetail, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customTitleText(context, petDetail),
        subtitleText(subtitle),
      ],
    );
  }

  editIcon() {
    return const Icon(Icons.edit, size: 18, color: Colors.black);
  }
}
