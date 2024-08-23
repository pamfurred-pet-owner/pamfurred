import 'package:flutter/material.dart';
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
        return 'assets/default_rating.png'; // Use a default image if needed
    }
  }

  Map<String, dynamic> serviceProviders = {
    // Service provider data...
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
                  onPressed: () {},
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
              ],
            ),
            const SizedBox(height: primarySizedBox),
            Expanded(
              child: ListView.builder(
                itemCount: providers.length,
                itemBuilder: (context, index) {
                  var provider = providers[index];
                  return SizedBox(
                    height: 100,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 1.5,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.network(
                            provider['image']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(secondarySizedBox),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customTitleText(
                                      context, provider['name'] ?? 'No name'),
                                  const SizedBox(height: primarySizedBox),
                                  Text(
                                    provider['service'] ?? 'No service',
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
                                      const SizedBox(height: primarySizedBox),
                                      customTitleTextWithPrimaryColor(
                                          context, "${provider['price']}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: secondarySizedBox),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  getRatingImage(provider['rating'] ?? 'N/A'),
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
