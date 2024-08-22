import 'package:flutter/material.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';

class SearchResultsScreen extends StatefulWidget {
  final int index;

  const SearchResultsScreen({super.key, required this.index});

  @override
  State<SearchResultsScreen> createState() => SearchResultsScreenState();
}

class SearchResultsScreenState extends State<SearchResultsScreen> {
  // Method to check what service category was selected on the home screen
  void checkSelectedServiceCategory(int index) {
    String selectedServiceCategory;
    switch (index) {
      case 0:
        selectedServiceCategory = "Veterinary service";
        break;
      case 1:
        selectedServiceCategory = "Pet grooming";
        break;
      case 2:
        selectedServiceCategory = "Pet boarding";
        break;
    }
  }

  // Mock db for serviceProvider data
  Map<String, dynamic> serviceProviders = {
    "Paws & Claws": {
      "category": "Pet Grooming",
      "service": "Bath",
      "image": "assets/images/bath.png",
      "price": 300,
      "rating": "positive",
    },
    "Furry Friends": {
      "category": "Pet Grooming",
      "service": "Hair Style",
      "image": "assets/images/hair_style.png",
      "price": 600,
      "rating": "neutral",
    },
    "Pet Paradise": {
      "category": "Pet Boarding",
      "service": "Cologne",
      "image": "assets/images/cologne.png",
      "price": 150,
      "rating": "positive",
    },
    "The Pampered Pet": {
      "category": "Pet Grooming",
      "service": "Nail Trim",
      "image": "assets/images/nail_trim.png",
      "price": 200,
      "rating": "positive",
    },
    "Furry Tails": {
      "category": "Veterinary Service",
      "service": "Teeth Cleaning",
      "image": "assets/images/teeth_cleaning.png",
      "price": 400,
      "rating": "neutral",
    },
    "Whiskers & Wags": {
      "category": "Pet Grooming",
      "service": "Ear Cleaning",
      "image": "assets/images/ear_cleaning.png",
      "price": 250,
      "rating": "positive",
    },
    "Pet Care Plus": {
      "category": "Veterinary Service",
      "service": "Flea Treatment",
      "image": "assets/images/flea_treatment.png",
      "price": 350,
      "rating": "negative",
    }
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenPadding(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.settings, color: Colors.black),
                        iconAlignment: IconAlignment.end,
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
                  // ListView.builder(
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: (pgSpController.pgSp.length <= 10)
                  //         ? pgSpController.pgSp.length
                  //         : 10,
                  //     itemBuilder: (context, index) {
                  //       final sp = pgSpController.pgSp[index];
                  //       final imageUrl = (sp.image == '')
                  //           ? 'assets/pamfurred_logo.png'
                  //           : sp.image; // Default to Pamfurred logo if there's no uploaded image
                  //       final rating = (sp.rating == 0.0)
                  //           ? 'N/A'
                  //           : sp.rating; // Default to 'N/A' if rating is 0.0
                  //       return Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: primarySizedBox),
                  //         child: SizedBox(
                  //           width: 250,
                  //           child: Card(
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(
                  //                     secondaryBorderRadius)),
                  //             elevation: 0,
                  //             color: Colors.transparent,
                  //             child: Column(
                  //               children: [
                  //                 Stack(children: [
                  //                   Positioned(
                  //                     child: Container(
                  //                       width: double.infinity,
                  //                       height: 150,
                  //                       decoration: BoxDecoration(
                  //                           color: primaryColor,
                  //                           borderRadius: BorderRadius.circular(
                  //                               primaryBorderRadius)),
                  //                     ),
                  //                   ),
                  //                   Positioned(
                  //                     child: ClipRRect(
                  //                       borderRadius: BorderRadius.circular(
                  //                           primaryBorderRadius),
                  //                       child: Image.network(
                  //                         imageUrl,
                  //                         width: double.infinity,
                  //                         height: 150,
                  //                         fit: (sp.image != '')
                  //                             ? BoxFit.cover
                  //                             : BoxFit.contain,
                  //                         loadingBuilder: (BuildContext context,
                  //                             Widget child,
                  //                             ImageChunkEvent?
                  //                                 loadingProgress) {
                  //                           if (loadingProgress == null) {
                  //                             return child;
                  //                           } else {
                  //                             return const SizedBox(
                  //                                 height: 150,
                  //                                 child: Center(
                  //                                     child:
                  //                                         CircularProgressIndicator()));
                  //                           }
                  //                         },
                  //                         errorBuilder: (BuildContext context,
                  //                             Object exception,
                  //                             StackTrace? stackTrace) {
                  //                           return const SizedBox(
                  //                               width: double.infinity,
                  //                               height: 150,
                  //                               child: Center(
                  //                                   child: Icon(Icons.error)));
                  //                         },
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ]),
                  //                 const SizedBox(height: primarySizedBox),
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     Flexible(
                  //                       child: Text(sp.name,
                  //                           overflow: TextOverflow.ellipsis,
                  //                           maxLines: 1,
                  //                           style: const TextStyle(
                  //                               fontSize: regularText,
                  //                               fontWeight: mediumWeight)),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 const SizedBox(height: primarySizedBox),
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Row(
                  //                       children: [
                  //                         const Icon(Icons.star,
                  //                             size: 19, color: secondaryColor),
                  //                         Text(rating.toString())
                  //                       ],
                  //                     ),
                  //                     Row(
                  //                       children: [
                  //                         const Icon(CupertinoIcons.location,
                  //                             size: 19),
                  //                         Text(calculateDistance(
                  //                             sp.latitude, sp.longitude))
                  //                       ],
                  //                     )
                  //                   ],
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
