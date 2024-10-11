import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/header.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/pet_profile_provider.dart';
import 'package:pamfurred/screens/pet_profile.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase

class ProfileScreen extends ConsumerStatefulWidget {
  final String userId; // UUID of the logged-in user

  const ProfileScreen({super.key, required this.userId});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  Map<String, dynamic>? profileData; // Store user data
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the screen initializes
  }

  // Function to fetch user data from Supabase
  Future<void> _fetchUserData() async {
    try {
      final response = await Supabase.instance.client
          .from('user')
          .select()
          .eq('user_id', widget.userId)
          .single(); // Query Supabase for user info

      setState(() {
        profileData = response;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false; // Stop loading even on error
      });
      // Show a snackbar on error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load user data')),
      );
    }
  }

  String convertToAsterisks(String text) {
    return '*' * text.length; // Create a string of asterisks with the same length
  }

  @override
  Widget build(BuildContext context) {
    // Access the list of pet profiles
    final petProfileData = ref.watch(petProfileProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenPadding(context),
              child: isLoading
                  ? const CircularProgressIndicator() // Show loading spinner
                  : Column(children: [
                      const SizedBox(height: tertiarySizedBox),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSectionHeader(profileData?['username'] ?? ''),
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
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      petProfileData.length + 1, // Add 1 for the Add button
                                  itemBuilder: (context, index) {
                                    // Logic for pet profiles and "Add" button
                                    final petProfileImage = index < petProfileData.length
                                        ? petProfileData[index]['image'] ?? ''
                                        : '';
                                    return index == petProfileData.length
                                        ? _buildAddPetButton(context)
                                        : _buildPetProfile(petProfileImage, index);
                                  },
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: primarySizedBox),
                      _buildDetailsCard(context, "Personal details"),
                      const SizedBox(height: primarySizedBox),
                      _buildAccountCard(context),
                    ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddPetButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
      child: const ClipOval(
        child: Material(
          color: lightGreyColor, // Button color
          child: SizedBox(
              width: 45,
              child: Icon(Icons.add, color: primaryColor)),
        ),
      ),
    );
  }

  Widget _buildPetProfile(String imageUrl, int index) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: tertiarySizedBox),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            slideUpRoute(PetProfileScreen(petId: index + 1)),
          );
        },
        child: ClipOval(
          child: Image.network(
            imageUrl,
            height: 40,
            width: 45,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              return loadingProgress == null
                  ? child
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(height: 40, width: 45, color: Colors.white),
                    );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard(BuildContext context, String title) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(width: .15, color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              customTitleText(context, title),
            ]),
            const SizedBox(height: secondarySizedBox),
            SizedBox(
              height: 364,
              child: Column(
                children: [
                  _detailsCard(
                    context: context,
                    title: "Name",
                    details:
                        "${profileData?['first_name']} ${profileData?['last_name']}" ?? '',
                  ),
                  _detailsCard(
                    context: context,
                    title: "Phone number",
                    details: profileData?['phone_number'] ?? '',
                  ),
                  _detailsCard(
                    context: context,
                    title: "Email address",
                    details: profileData?['email_address'] ?? '',
                  ),
                  _detailsCard(
                    context: context,
                    title: "Address",
                    details:
                        "${profileData?['door_no']}, ${profileData?['street']}, ${profileData?['barangay']}, ${profileData?['city']}" ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(width: .15, color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              customTitleText(context, "Account"),
            ]),
            const SizedBox(height: primarySizedBox),
            SizedBox(
              height: 182,
              child: Column(
                children: [
                  _detailsCard(
                    context: context,
                    title: "Username",
                    details: profileData?['username'] ?? '',
                  ),
                  _detailsCard(
                    context: context,
                    title: "Password",
                    details: convertToAsterisks(profileData?['password'] ?? ''),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsCard({
    required BuildContext context,
    required String title,
    required String? details,
  }) {
    return InkWell(
      onTap: details != null && details.isNotEmpty
          ? () => _editDetails(context, title, details)
          : null,
      child: Card(
        color: lightGreyColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(details ?? '', style: const TextStyle(color: greyColor)),
                  ],
                ),
              ),
              const Icon(Icons.edit, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _editDetails(BuildContext context, String field, String details) async {
    if (field == "Name") {
      final newValues = await _showEditNameDialog(context, details);
      if (newValues != null) {
        await Supabase.instance.client
            .from('user')
            .update({
              'first_name': newValues[0],
              'last_name': newValues[1],
            })
            .eq('user_id', widget.userId);
        _fetchUserData(); // Refresh user data
      }
    } else if (field == "Phone number") {
      final newPhone = await _showEditSingleFieldDialog(context, details, "Phone Number");
      if (newPhone != null) {
        await Supabase.instance.client
            .from('user')
            .update({'phone_number': newPhone})
            .eq('user_id', widget.userId);
        _fetchUserData(); // Refresh user data
      }
    } else if (field == "Email address") {
      final newEmail = await _showEditSingleFieldDialog(context, details, "Email Address");
      if (newEmail != null) {
        await Supabase.instance.client
            .from('user')
            .update({'email_address': newEmail})
            .eq('user_id', widget.userId);
        _fetchUserData(); // Refresh user data
      }
    } else if (field == "Username") {
      final newUsername = await _showEditSingleFieldDialog(context, details, "Username");
      if (newUsername != null) {
        await Supabase.instance.client
            .from('user')
            .update({'username': newUsername})
            .eq('user_id', widget.userId);
        _fetchUserData(); // Refresh user data
      }
    } else if (field == "Address") {
      final newAddressValues = await _showEditAddressDialog(context);
      if (newAddressValues != null) {
        await Supabase.instance.client
            .from('address') // Assuming you have an address table
            .update({
              'street': newAddressValues[0],
              'barangay': newAddressValues[1],
              'city': newAddressValues[2],
            })
            .eq('user_id', widget.userId); // Assuming you have a reference from user to address
        _fetchUserData(); // Refresh user data
      }
    }
  }

  Future<List<String?>?> _showEditNameDialog(BuildContext context, String currentValue) {
    TextEditingController firstNameController = TextEditingController(text: currentValue.split(" ")[0]);
    TextEditingController lastNameController = TextEditingController(text: currentValue.split(" ").length > 1 ? currentValue.split(" ")[1] : '');

    return showDialog<List<String?>?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: firstNameController, decoration: const InputDecoration(labelText: "First Name")),
              TextField(controller: lastNameController, decoration: const InputDecoration(labelText: "Last Name")),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            TextButton(
              onPressed: () => Navigator.of(context).pop([firstNameController.text, lastNameController.text]),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showEditSingleFieldDialog(BuildContext context, String currentValue, String title) {
    TextEditingController controller = TextEditingController(text: currentValue);

    return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: title),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<List<String?>?> _showEditAddressDialog(BuildContext context) {
    TextEditingController streetController = TextEditingController(text: profileData?['street'] ?? '');
    TextEditingController barangayController = TextEditingController(text: profileData?['barangay'] ?? '');
    TextEditingController cityController = TextEditingController(text: profileData?['city'] ?? '');

    return showDialog<List<String?>?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: streetController, decoration: const InputDecoration(labelText: "Street")),
              TextField(controller: barangayController, decoration: const InputDecoration(labelText: "Barangay")),
              TextField(controller: cityController, decoration: const InputDecoration(labelText: "City")),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            TextButton(
              onPressed: () => Navigator.of(context).pop([streetController.text, barangayController.text, cityController.text]),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
