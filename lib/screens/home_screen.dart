import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/custom_padded_button.dart';
import 'package:pamfurred/components/distance_calculator.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/providers/serviceprovider_provider.dart';
import 'package:pamfurred/screens/search_results.dart';
import 'package:pamfurred/screens/serviceprovider_profile.dart';
import '../components/title_text.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  bool isSelected = false;
  int selectedIndex = 0; // No service category selected initially

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
      isSelected = !isSelected;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-caching images
    precacheImage(const AssetImage('assets/vet_service.png'), context);
    precacheImage(const AssetImage('assets/pet_grooming.png'), context);
    precacheImage(const AssetImage('assets/pet_boarding.png'), context);
    precacheImage(const AssetImage('assets/pamfurred_logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: screenPadding(context),
            child: Column(
              children: [
                Column(children: [
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      customTitleText(context, "Upcoming appointments"),
                    ],
                  ),
                  const SizedBox(height: primarySizedBox),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(secondaryBorderRadius)),
                    elevation: 1.5,
                    color: const Color.fromRGBO(255, 246, 228, 1),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'January 2, 2024, 9 am',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: regularText),
                                ),
                              ],
                            ),
                            SizedBox(height: primarySizedBox),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Paws and Claws Pet Station',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: regularText),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: primarySizedBox),
                  TextButton(
                      onPressed: () {},
                      child: customPaddedTextButton(
                          text: "View appointments", onPressed: () {}))
                ]),
                const SizedBox(height: primarySizedBox),
                Row(
                  children: [
                    customTitleText(context, "I'm looking for"),
                  ],
                ),
                const SizedBox(height: primarySizedBox),
                Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => onItemTap(0),
                            child: Stack(children: [
                              SizedBox(
                                height: 350,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 24,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius)),
                                    key: ValueKey<int>(selectedIndex),
                                    elevation: 1.5,
                                    color: selectedIndex == 0
                                        ? primaryColor
                                        : lightGreyColor,
                                    child: Stack(children: [
                                      Positioned(
                                        top: 32,
                                        left: 16,
                                        width: 100,
                                        child: Text("Veterinary service",
                                            style: TextStyle(
                                                fontSize: regularText,
                                                color: selectedIndex == 0
                                                    ? Colors.white
                                                    : Colors.black)),
                                      ),
                                      Positioned(
                                        top: 80,
                                        bottom: -50,
                                        right: -70,
                                        child: Image.asset(
                                          'assets/vet_service.png',
                                          width: 230,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                              if (selectedIndex == 0) selectedServiceCategory()
                            ]),
                          ),
                          const SizedBox(width: primarySizedBox),
                          Column(children: [
                            GestureDetector(
                              onTap: () => onItemTap(1),
                              child: ClipRect(
                                child: Stack(children: [
                                  SizedBox(
                                    height: 171,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            24,
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                secondaryBorderRadius)),
                                        key: ValueKey<int>(selectedIndex),
                                        elevation: 1.5,
                                        color: selectedIndex == 1
                                            ? primaryColor
                                            : lightGreyColor,
                                        child: Stack(children: [
                                          Positioned(
                                            top: 32,
                                            left: 16,
                                            width: 70,
                                            child: Text("Pet grooming",
                                                style: TextStyle(
                                                    fontSize: regularText,
                                                    color: selectedIndex == 1
                                                        ? Colors.white
                                                        : Colors.black)),
                                          ),
                                          Positioned(
                                            top: 80,
                                            bottom: -32,
                                            right: -32,
                                            child: Image.asset(
                                              'assets/pet_grooming.png',
                                              width: 100,
                                              fit: BoxFit.contain,
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  ),
                                  if (selectedIndex == 1)
                                    selectedServiceCategory()
                                ]),
                              ),
                            ),
                            const SizedBox(height: primarySizedBox),
                            GestureDetector(
                              onTap: () => onItemTap(2),
                              child: Stack(children: [
                                SizedBox(
                                  height: 171.5,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      24,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              secondaryBorderRadius)),
                                      key: ValueKey<int>(selectedIndex),
                                      elevation: 1.5,
                                      color: selectedIndex == 2
                                          ? primaryColor
                                          : lightGreyColor,
                                      child: Stack(children: [
                                        Positioned(
                                          top: 32,
                                          left: 16,
                                          width: 70,
                                          child: Text("Pet boarding",
                                              style: TextStyle(
                                                  fontSize: regularText,
                                                  color: selectedIndex == 2
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                        Positioned(
                                          top: 80,
                                          bottom: -32,
                                          right: -20,
                                          child: Image.asset(
                                            'assets/pet_boarding.png',
                                            width: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                if (selectedIndex == 2)
                                  selectedServiceCategory()
                              ]),
                            ),
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(height: primarySizedBox),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: customPaddedTextButton(
                                text: "Submit",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      crossFadeRoute(SearchResultsScreen(
                                          index: selectedIndex)));
                                }))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: primarySizedBox),
                getRecos(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectedServiceCategory() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: .1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: const Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  getRecos() {
    return Column(
      children: [
        const SizedBox(height: primarySizedBox),
        recoHeader("Pet grooming service providers"),
        const SizedBox(height: secondarySizedBox),
        serviceProviders("pet-grooming"),
        recoHeader("Pet boarding service providers"),
        const SizedBox(height: secondarySizedBox),
        serviceProviders("pet-boarding"),
        recoHeader("Veterinary service providers"),
        const SizedBox(height: secondarySizedBox),
        serviceProviders("veterinary-service")
      ],
    );
  }

  serviceProviders(String serviceCategory) {
    // Access the list of maps from the provider
    final allitems = ref.watch(mockDbProvider);

    // Filter the list of maps where 'age' is 24
    final items =
        allitems.where((map) => map['category'] == serviceCategory).toList();

    if (items.isEmpty) {
      // if (pgSpController.isLoading.value) {
      return const SizedBox(
          height: 150, child: Center(child: CircularProgressIndicator()));
    }
    return SizedBox(
      height: 207,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: (items.length <= 10) ? items.length : 10,
          itemBuilder: (context, index) {
            final sp = items[index];
            const defaultImage = 'assets/pamfurred_logo.png';
            final imageUrl = (sp['image'] == '')
                ? defaultImage
                : sp[
                    'image']; // Default to Pamfurred logo if there's no uploaded image
            final rating = (sp['rating'] == 0.0)
                ? 'N/A'
                : sp['rating']; // Default to 'N/A' if rating is 0.0
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: primarySizedBox),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        rightToLeftRoute(const ServiceproviderProfileScreen()));
                  },
                  child: SizedBox(
                    width: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius)),
                      elevation: 0,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Stack(children: [
                            Positioned(
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: lightGreyColor,
                                    borderRadius: BorderRadius.circular(
                                        primaryBorderRadius)),
                              ),
                            ),
                            Positioned(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(primaryBorderRadius),
                                child: imageUrl == defaultImage
                                    ? Image.asset(defaultImage,
                                        width: double.infinity,
                                        height: 150,
                                        fit: BoxFit.contain)
                                    : Image.network(
                                        imageUrl,
                                        width: double.infinity,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return const SizedBox(
                                                height: 150,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator()));
                                          }
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const SizedBox(
                                              width: double.infinity,
                                              height: 150,
                                              child: Center(
                                                  child: Icon(Icons.error)));
                                        },
                                      ),
                              ),
                            ),
                          ]),
                          const SizedBox(height: primarySizedBox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(sp['name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: regularText,
                                        fontWeight: mediumWeight)),
                              ),
                            ],
                          ),
                          const SizedBox(height: primarySizedBox),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 19, color: secondaryColor),
                                  Text(rating.toString())
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(CupertinoIcons.location, size: 19),
                                  Text(calculateDistance(
                                      sp['latitude'], sp['longitude']))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }

  recoHeader(String header) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customTitleText(context, header),
        TextButton(
          onPressed: () {},
          child: const Text("More",
              style: TextStyle(color: primaryColor, fontSize: regularText)),
        )
      ],
    );
  }
}
