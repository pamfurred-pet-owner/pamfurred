import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/custom_padded_button.dart';
import 'package:pamfurred/components/pull_to_refresh.dart';
import 'package:pamfurred/math_functions/distance_calculator.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/providers/global_providers.dart';
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
  final ScrollController _scrollController = ScrollController();

  bool isSelected = false;
  int selectedIndex = 0; // First(1st) service category selected initially

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        ref
            .read(visibilityProvider.notifier)
            .setVisible(false); // Hide AppBar & BottomNavBar
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        ref
            .read(visibilityProvider.notifier)
            .setVisible(true); // Show AppBar & BottomNavBar
      }
    });
  }

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
      isSelected = !isSelected;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-caching images
    const imageAssets = [
      'assets/vet_service.png',
      'assets/pet_grooming.png',
      'assets/pet_boarding.png',
      'assets/pamfurred_logo.png'
    ];
    for (var image in imageAssets) {
      precacheImage(AssetImage(image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ref.watch(visibilityProvider) ? appBar(context) : null,
        body: PullToRefresh(
          child: ListView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: screenPadding(context),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: secondarySizedBox),
                        _sectionHeader(context, "Upcoming appointments"),
                        const SizedBox(height: primarySizedBox),
                        _upcomingAppointmentCard(),
                        const SizedBox(height: primarySizedBox),
                        _viewAppointmentsButton(),
                        const SizedBox(height: primarySizedBox),
                        _sectionHeader(context, "I'm looking for"),
                        const SizedBox(height: primarySizedBox),
                        _serviceSelection(context),
                        const SizedBox(height: primarySizedBox),
                        _submitButton(),
                        const SizedBox(height: primarySizedBox),
                        _getRecos(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Row(children: [customTitleText(context, title)]);
  }

  Widget _upcomingAppointmentCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(secondaryBorderRadius),
      ),
      elevation: 1.5,
      color: lighterSecondaryColor,
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
                      fontSize: regularText,
                    ),
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
                      fontSize: regularText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewAppointmentsButton() {
    return TextButton(
      onPressed: () {},
      child: customPaddedTextButton(
        text: "View appointments",
        onPressed: () {},
      ),
    );
  }

  Widget _serviceSelection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _serviceCard(
            context, 0, 'Veterinary service', 'assets/vet_service.png'),
        const SizedBox(width: primarySizedBox),
        Column(
          children: [
            _serviceCard(context, 1, 'Pet grooming', 'assets/pet_grooming.png',
                height: 171),
            const SizedBox(height: primarySizedBox),
            _serviceCard(context, 2, 'Pet boarding', 'assets/pet_boarding.png',
                height: 171.5),
          ],
        ),
      ],
    );
  }

  Widget _serviceCard(
      BuildContext context, int index, String title, String assetImage,
      {double height = 350}) {
    return GestureDetector(
      onTap: () => onItemTap(index),
      child: Stack(
        children: [
          SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width / 2 - 25,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(secondaryBorderRadius),
                ),
                key: ValueKey<int>(selectedIndex),
                elevation: 1.5,
                color: selectedIndex == index ? primaryColor : lightGreyColor,
                child: Stack(
                  children: [
                    Positioned(
                      top: 32,
                      left: 16,
                      width: 100,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: regularText,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: -50,
                      child: Image.asset(
                        assetImage,
                        width: 230,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (selectedIndex == index) _selectedServiceCategory(),
        ],
      ),
    );
  }

  Widget _selectedServiceCategory() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0.1,
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

  Widget _submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              crossFadeRoute(SearchResultsScreen(index: selectedIndex)),
            );
          },
          child: customPaddedTextButton(
              text: "Submit",
              onPressed: () {
                Navigator.push(context,
                    crossFadeRoute(SearchResultsScreen(index: selectedIndex)));
              }),
        ),
      ],
    );
  }

  Widget _getRecos() {
    return Column(
      children: [
        const SizedBox(height: primarySizedBox),
        _recoSection("Pet grooming service providers", "Pet grooming"),
        _recoSection("Pet boarding service providers", "Pet boarding"),
        _recoSection("Veterinary service providers", "Veterinary service"),
      ],
    );
  }

  Widget _recoSection(String header, String category) {
    return Column(
      children: [
        _sectionHeader(context, header),
        const SizedBox(height: secondarySizedBox),
        _serviceProviders(category),
        const SizedBox(height: tertiarySizedBox)
      ],
    );
  }

  Widget _serviceProviders(String serviceCategory) {
    final allItems = ref.watch(mockDbProvider);
    final items =
        allItems.where((item) => item['category'] == serviceCategory).toList();

    if (items.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: 225,
      child: ListView.builder(
        physics:
            const BouncingScrollPhysics(), // Prevents the list from stretching
        scrollDirection: Axis.horizontal,
        itemCount: items.length > 10 ? 10 : items.length,
        itemBuilder: (context, index) {
          final sp = items[index];
          final imageUrl = sp['image'].isEmpty
              ? 'https://tinyurl.com/3tnt6yyy'
              : sp['image'];
          final rating = (sp['rating'] == 0.0)
              ? 'N/A'
              : sp['rating']; // Default to 'N/A' if rating is 0.0

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: primarySizedBox),
              child: GestureDetector(
                onTap: () {
                  ref.read(selectedSpIndexProvider.notifier).state =
                      sp['sp_id'].toString();
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
                              child: Image.network(
                                imageUrl,
                                width: double.infinity,
                                height: 150,
                                fit: sp['image'].isEmpty
                                    ? BoxFit.contain
                                    : BoxFit.cover,
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
                                    Object exception, StackTrace? stackTrace) {
                                  return const SizedBox(
                                      width: double.infinity,
                                      height: 150,
                                      child: Center(child: Icon(Icons.error)));
                                },
                              ),
                            ),
                          ),
                        ]),
                        const SizedBox(height: secondarySizedBox),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(sp['name'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: regularText,
                                      fontWeight: mediumWeight)),
                            ),
                            sentimentLabelTextWidget(sp['sentiment_label']),
                          ],
                        ),
                        const SizedBox(height: secondarySizedBox),
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
        },
      ),
    );
  }

  Widget serviceProviderImage(String imageUrl) {
    return Container(
      height: 140,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(secondaryBorderRadius),
        color: Colors.grey[200],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  Widget serviceProviderName(String name) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget sentimentLabelTextWidget(String text) {
    Color borderColor;

    if (text == 'positive') {
      borderColor = Colors.green;
    } else if (text == 'negative') {
      borderColor = Colors.red;
    } else {
      borderColor = darkGreyColor;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: .75), // Outline border
        borderRadius: BorderRadius.circular(
            primaryBorderRadius), // Optional: for rounded corners
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 4.0), // Padding around the text
      child: Text(
        text,
        style: TextStyle(
          fontSize: smallText,
          color: borderColor, // Use the same color for the text
        ),
      ),
    );
  }
}
