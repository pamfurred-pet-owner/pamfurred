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
    // Fetch profile data from the user table in Supabase
    final profileData = ref.watch(profileProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: profileData.when(
              data: (data) {
                if (data == null) {
                  return const Text('No user data available');
                }

                return SizedBox(
                  width: screenPadding(context),
                  child: Column(
                    children: [
                      const SizedBox(height: tertiarySizedBox),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSectionHeader(data['username']),
                          const Icon(Icons.settings, size: 25),
                        ],
                      ),
                      const SizedBox(height: primarySizedBox),
                      Card(
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: .15, color: Colors.black)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      customTitleText(
                                          context, "Personal details"),
                                    ],
                                  ),
                                  const SizedBox(height: secondarySizedBox),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: primarySizedBox),
                                    width: getScreenWidth(context) -
                                        secondarySizedBox,
                                    child: SizedBox(
                                      height: 340,
                                      child: Column(
                                        children: [
                                          detailsCard(
                                              title: "Name",
                                              details:
                                                  "${data['first_name']} ${data['last_name']}"),
                                          detailsCard(
                                              title: "Phone number",
                                              details: data['contact_no']),
                                          detailsCard(
                                              title: "Email address",
                                              details: data['email_address']),
                                          detailsCard(
                                              title: "Username",
                                              details: data['username']),
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
                      // Other UI elements here...
                    ],
                  ),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
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
                    details ?? '',
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
