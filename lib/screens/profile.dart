import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/header.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/pet_profile_provider.dart';
import 'package:pamfurred/providers/profile_provider.dart';
import 'package:pamfurred/screens/pet_profile.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  String convertToAsterisks(String text) {
    return '*' *
        text.length; // Create a string of asterisks with the same length
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch profile data from the provider
    final profileData = ref.watch(profileProvider);

    // Access the list of pet profiles
    final petProfileData = ref.watch(petProfileProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenPadding(context),
              child: Column(children: [
                const SizedBox(height: tertiarySizedBox),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSectionHeader(profileData['username']),
                    const Icon(Icons.settings, size: 25),
                  ],
                ),
                const SizedBox(height: primarySizedBox),
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: .15, color: Colors.black)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTitleText(context, "Pets"),
                            const Icon(Icons.edit,
                                size: 20, color: Colors.black)
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 60, // Set a fixed height for the ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: petProfileData.length +
                                1, // Add 1 for the Add button
                            itemBuilder: (context, index) {
                              // Determine padding based on index
                              double leftPadding = index == 0
                                  ? tertiarySizedBox
                                  : primarySizedBox;
                              double rightPadding =
                                  index == petProfileData.length
                                      ? tertiarySizedBox
                                      : 0;

                              if (index == petProfileData.length) {
                                // This is the "Add" button
                                return Container(
                                  padding: EdgeInsets.only(
                                      left: leftPadding,
                                      right: rightPadding,
                                      bottom: 13),
                                  child: const ClipOval(
                                    child: Material(
                                      color: lightGreyColor, // Button color
                                      child: SizedBox(
                                          width: 45,
                                          child: Icon(Icons.add,
                                              color: primaryColor)),
                                    ),
                                  ),
                                );
                              } else {
                                final petProfileImage =
                                    petProfileData[index]['image'] ?? '';
                                return Container(
                                  padding: EdgeInsets.only(
                                      left: leftPadding,
                                      right: rightPadding,
                                      bottom: tertiarySizedBox),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        slideUpRoute(
                                            PetProfileScreen(petId: index + 1)),
                                      );
                                    },
                                    child: ClipOval(
                                      child: Image.network(
                                        petProfileImage,
                                        height: 40,
                                        width: 45,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          // Show a shimmer effect while loading
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              height: 40,
                                              width: 45,
                                              color: Colors.white,
                                            ),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: primarySizedBox),
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: .15, color: Colors.black)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                customTitleText(context, "Personal details"),
                              ],
                            ),
                            const SizedBox(height: secondarySizedBox),
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: primarySizedBox),
                              width:
                                  getScreenWidth(context) - secondarySizedBox,
                              child: SizedBox(
                                height: 340,
                                child: Column(
                                  children: [
                                    detailsCard(
                                        title: "Name",
                                        details:
                                            "${profileData['first_name']} ${profileData['last_name']}"),
                                    detailsCard(
                                        title: "Phone number",
                                        details: profileData['phone_number']),
                                    detailsCard(
                                        title: "Email address",
                                        details: profileData['email_address']),
                                    detailsCard(
                                        title: "Address",
                                        details: profileData['address'])
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: primarySizedBox),
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: .15, color: Colors.black)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                customTitleText(context, "Account"),
                              ],
                            ),
                            const SizedBox(height: primarySizedBox),
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: primarySizedBox),
                              width:
                                  getScreenWidth(context) - secondarySizedBox,
                              child: SizedBox(
                                height: 175,
                                child: Column(
                                  children: [
                                    detailsCard(
                                        title: "Username",
                                        details: profileData['username']),
                                    detailsCard(
                                        title: "Password",
                                        details: convertToAsterisks(
                                            profileData['password'])),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  detailsCard({required String title, String? details}) {
    return Card(
      color: lightGreyColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: tertiarySizedBox,
            vertical: tertiarySizedBox), // Padding inside the row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  const SizedBox(height: primarySizedBox),
                  Text(
                    // Change this to the content from the db
                    details ?? details!,
                    style:
                        const TextStyle(color: greyColor, fontSize: smallText),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
