import 'package:flutter/material.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/screens/edit_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/title_text.dart';

class SearchResultsScreen extends StatefulWidget {
  final int index;

  const SearchResultsScreen({super.key, required this.index});

  @override
  State<SearchResultsScreen> createState() => SearchResultsScreenState();
}

class SearchResultsScreenState extends State<SearchResultsScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a delay to show the shimmer effect
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  String checkSelectedServiceCategory(int index) {
    switch (index) {
      case 0:
        return "Veterinary service";
      case 1:
        return "Pet grooming";
      case 2:
        return "Pet boarding";
      default:
        return "";
    }
  }

  List<Map<String, dynamic>> getServiceProvidersByCategory(int index) {
    String selectedServiceCategory = checkSelectedServiceCategory(index);
    List<Map<String, dynamic>> providersList = [];

    serviceProviders.forEach((name, details) {
      if (details['category'].toString().toLowerCase() ==
          selectedServiceCategory.toLowerCase()) {
        providersList.add({
          'name': name,
          'image': details['image'] ?? '',
          'service': details['service'] ?? '',
          'price': details['price'] ?? 0,
          'rating': details['rating'] ?? 'N/A',
        });
      }
    });

    return providersList;
  }

  String getRatingImage(String rating) {
    switch (rating.toLowerCase()) {
      case 'positive':
        return 'assets/positive.png';
      case 'neutral':
        return 'assets/neutral.png';
      case 'negative':
        return 'assets/negative.png';
      default:
        return 'assets/default_rating.png'; // Use a default image
    }
  }

  // Mock db for serviceProvider data
  Map<String, dynamic> serviceProviders = {
    "Paws & Claws": {
      "category": "Pet grooming",
      "service": "Bath",
      "image": "https://tinyurl.com/yt2ku22y",
      "price": 300,
      "rating": "positive",
    },
    "Furry Friends": {
      "category": "Pet grooming",
      "service": "Hair Style",
      "image": "https://tinyurl.com/aa2fb5as",
      "price": 600,
      "rating": "neutral",
    },
    "Pet Paradise": {
      "category": "Pet boarding",
      "service": "Cologne",
      "image": "https://tinyurl.com/yc4hb5jc",
      "price": 150,
      "rating": "positive",
    },
    "The Pampered Pet": {
      "category": "Pet grooming",
      "service": "Nail Trim",
      "image": "https://tinyurl.com/3m2z499d",
      "price": 200,
      "rating": "positive",
    },
    "Furry Tails": {
      "category": "Veterinary service",
      "service": "Teeth Cleaning",
      "image": "https://tinyurl.com/yc2fdx79",
      "price": 400,
      "rating": "neutral",
    },
    "Whiskers & Wags": {
      "category": "Pet grooming",
      "service": "Ear Cleaning",
      "image": "https://tinyurl.com/4mrvr4de",
      "price": 250,
      "rating": "positive",
    },
    "Pet Care Plus": {
      "category": "Veterinary service",
      "service": "Flea Treatment",
      "image": "https://tinyurl.com/mtp8s52f",
      "price": 350,
      "rating": "negative",
    },
    "Whiskers & Tails": {
      "category": "Pet grooming",
      "service": "Bath",
      "image": "https://tinyurl.com/y99279t4",
      "price": 200,
      "rating": 0,
    },
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> providers =
        getServiceProvidersByCategory(widget.index);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        rightToLeftRoute(
                          EditPreferencesScreen(index: widget.index),
                        ));
                  },
                  icon: const Icon(Icons.settings, color: Colors.black),
                  label: const Text('Preferences',
                      style: TextStyle(color: Colors.black)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(secondaryBorderRadius),
                    ),
                  ),
                ),
                const SizedBox(width: tertiarySizedBox)
              ],
            ),
            const SizedBox(height: primarySizedBox),
            Expanded(
              child: isLoading
                  ? ListView.builder(
                      itemCount: 6, // number of shimmer items
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[300],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          secondarySizedBox),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 20,
                                            color: Colors.grey[300],
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            width: 100,
                                            height: 20,
                                            color: Colors.grey[300],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    color: Colors.grey[300],
                                  ),
                                  const SizedBox(width: tertiarySizedBox),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: providers.length,
                      itemBuilder: (context, index) {
                        var provider = providers[index];
                        return SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                elevation: 3,
                                shadowColor: lighterGreyColor,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Image.network(
                                      provider['image']!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            secondarySizedBox),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customTitleText(context,
                                                provider['name'] ?? 'No name'),
                                            const SizedBox(
                                                height: primarySizedBox),
                                            Text(
                                              provider['service'] ??
                                                  'No service',
                                              style: const TextStyle(
                                                fontSize: smallText,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "₱",
                                                  style: TextStyle(
                                                    fontSize: smallText,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: primarySizedBox),
                                                customTitleTextWithPrimaryColor(
                                                    context,
                                                    "${provider['price']}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          provider['rating'] == null ||
                                                  provider['rating'] == 0
                                              ? const Text(
                                                  'N/A',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Image.asset(
                                                  getRatingImage(
                                                      provider['rating']),
                                                  width: 25,
                                                  height: 25,
                                                ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: tertiarySizedBox,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: primarySizedBox),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
