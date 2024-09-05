import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/regular_text.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/sp_profile_provider.dart';
import 'package:pamfurred/providers/sp_tab_provider.dart';

class ServiceproviderProfileScreen extends ConsumerWidget {
  final String imageUrl;
  const ServiceproviderProfileScreen(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTabProvider);
    const defaultImage = 'https://tinyurl.com/3tnt6yyy';

    // Assuming the `formattedServiceDetailsProvider` returns a `Map<String, List<String>>`
    final services = ref.watch(formattedServiceDetailsProvider('pet-grooming'));

    final List<Widget> tabTitles = [
      Center(
        child: Text(
          "About",
          style: TextStyle(
              color: selectedIndex == 0 ? primaryColor : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: regularText),
        ),
      ),
      Center(
        child: Text(
          "Services",
          style: TextStyle(
              color: selectedIndex == 1 ? primaryColor : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: regularText),
        ),
      ),
      Center(
        child: Text(
          "Packages",
          style: TextStyle(
              color: selectedIndex == 2 ? primaryColor : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: regularText),
        ),
      ),
    ];

    final List<Widget> tabContents = [
      // About tab content
      Center(
        child: Column(
          children: [
            spDetailsHeader(
              CupertinoIcons.location_solid,
              "28th Street Nazareth, Cagayan de Oro City",
            ),
            const SizedBox(height: secondarySizedBox),
            spDetailsHeader(Icons.star, "4.5"),
            const SizedBox(height: secondarySizedBox),
            spDetailsHeader(Icons.home_repair_service, "In salon"),
            const SizedBox(height: secondarySizedBox),
            spDetailsHeader(Icons.access_time_filled, "9 AM - 6 PM"),
            const SizedBox(height: secondarySizedBox),
            spDetailsHeader(Icons.call, "092555517754"),
            const SizedBox(height: secondarySizedBox),
            spDetailsHeader(Icons.pets, "Caters dogs, cats, bunnies"),
            const SizedBox(height: secondarySizedBox),
            spDetailsHeader(Icons.house,
                "Pet grooming, pet boarding, and veterinary service"),
          ],
        ),
      ),
      // Services tab content with Stack-based cards
      Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customTitleText(context, "Grooming services"),
              ],
            ),
            SizedBox(
              height: getScreenHeight(context) - 405,
              child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    final serviceName = services.keys.elementAt(index);
                    final serviceDetails = services[serviceName] ?? [];

                    // Use `List<String>` to display data
                    final formattedString = serviceDetails.first;

                    return Stack(
                      children: [
                        Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () {},
                              splashColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          serviceName,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: regularText,
                                            fontWeight: regularWeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          formattedString,
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Additional widget that you want to place on top of the card
                        const Positioned(
                          top: 0,
                          bottom: 0,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: lightGreyColor,
                            child: Icon(
                              Icons.add,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      // Packages tab content
      Center(child: regularTextWidget("Packages")),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: primarySizedBox),
              Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: imageUrl == defaultImage ? BoxFit.contain : BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const SizedBox(
                        height: 150,
                        child: Center(child: CircularProgressIndicator()));
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Center(child: Icon(Icons.error)));
                },
              ),
              SizedBox(
                width: screenPadding(context),
                child: Column(
                  children: [
                    const SizedBox(height: secondarySizedBox),
                    customTitleTextWithPrimaryColor(
                        context, "Paws and Claws Pet Station"),
                    const SizedBox(height: primarySizedBox),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(tabContents.length, (index) {
                            return GestureDetector(
                              onTap: () => ref
                                  .read(selectedTabProvider.notifier)
                                  .state = index,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: primarySizedBox),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        quaternaryBorderRadius),
                                    color: selectedIndex == index
                                        ? lightGreyColor
                                        : Colors.transparent,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: tabTitles[index]),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: secondarySizedBox),
                        SizedBox(
                          width: double.infinity,
                          child: tabContents[selectedIndex],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: primarySizedBox),
            ],
          ),
        ),
      ),
    );
  }

  Widget spDetailsHeader(IconData icon, String detail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: Colors.black),
            const SizedBox(width: secondarySizedBox),
            regularGreyTextWidget(detail),
          ],
        ),
        const SizedBox(height: secondarySizedBox),
      ],
    );
  }
}
