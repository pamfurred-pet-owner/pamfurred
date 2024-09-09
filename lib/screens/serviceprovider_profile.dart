import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/regular_text.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/dropdown_menu_provder.dart';
import 'package:pamfurred/providers/sp_profile_provider_services.dart';
import 'package:pamfurred/providers/sp_tab_provider.dart';

class ServiceproviderProfileScreen extends ConsumerStatefulWidget {
  final String imageUrl;
  const ServiceproviderProfileScreen(this.imageUrl, {super.key});

  @override
  ConsumerState<ServiceproviderProfileScreen> createState() =>
      _ServiceproviderProfileScreenState();
}

class _ServiceproviderProfileScreenState
    extends ConsumerState<ServiceproviderProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedTabProvider);
    const defaultImage = 'https://tinyurl.com/3tnt6yyy';

    const double elevatedButtonHeight = 50;

    final allServices = ref.watch(servicesProvider);
    final List<String> serviceOptions = [
      'Pet grooming services',
      'Pet boarding services',
      'Veterinary services',
    ];

    final List<Widget> tabTitles = [
      Center(
        child: Text(
          "About",
          style: TextStyle(
              color: selectedIndex == 0 ? primaryColor : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: regularText),
        ),
      ),
      Center(
        child: Text(
          "Services",
          style: TextStyle(
              color: selectedIndex == 1 ? primaryColor : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: regularText),
        ),
      ),
      Center(
        child: Text(
          "Packages",
          style: TextStyle(
              color: selectedIndex == 2 ? primaryColor : Colors.black,
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
          ],
        ),
      ),
      // Services tab content with Stack-based cards
      Center(
        child: SizedBox(
          height: getScreenHeight(context) - 395,
          child: Column(
            children: [
              Row(
                children: [
                  // Replace dropdown with button to show modal bottom sheet
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(secondaryBorderRadius),
                        border: Border.all(width: 0.5, color: primaryColor)),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: serviceOptions.length,
                                  itemBuilder: (context, index) {
                                    final option = serviceOptions[index];
                                    return ListTile(
                                      title: Text(option),
                                      onTap: () {
                                        ref
                                            .read(selectedServiceProvider
                                                .notifier)
                                            .state = option;
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ref.watch(selectedServiceProvider),
                              style: const TextStyle(fontSize: regularText),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: secondarySizedBox,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allServices.length,
                  itemBuilder: (context, index) {
                    final service = allServices[index];
                    return Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(primaryBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(secondarySizedBox),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(primaryBorderRadius),
                              child: SizedBox(
                                width: 90,
                                height: 85,
                                child: Image.network(
                                  service.image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error, size: 70);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 16), // Adjust spacing as needed
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customTitleText(context, service.name),
                                  Text('₱${service.price}'),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width: 16), // Adjust spacing as needed
                            CircleAvatar(
                              backgroundColor: secondaryColor,
                              child: IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  // Handle add action
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: elevatedButtonHeight + tertiarySizedBox,
              )
            ],
          ),
        ),
      ),
      // Packages tab content
      Center(child: regularTextWidget("Packages")),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(secondaryBorderRadius),
              border: Border.all(width: 0.5, color: primaryColor),
              color: primaryColor),
          height: elevatedButtonHeight,
          margin: const EdgeInsets.all(primarySizedBox),
          child: TextButton(
            onPressed: () {},
            child: const Center(
              child: Text(
                'Book appointment',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: regularText,
                    fontWeight: regularWeight),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                widget.imageUrl,
                width: double.infinity,
                height: 200,
                fit: widget.imageUrl == defaultImage
                    ? BoxFit.contain
                    : BoxFit.cover,
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
                  return Container(
                      color: lighterGreyColor,
                      width: double.infinity,
                      height: 150,
                      child: const Center(child: Icon(Icons.error)));
                },
              ),
              SizedBox(
                width: screenPadding(context),
                child: Column(
                  children: [
                    const SizedBox(height: tertiarySizedBox),
                    customTitleText(context, "Paws and Claws Pet Station"),
                    const SizedBox(height: secondarySizedBox),
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
                                        ? lighterSecondaryColor
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
                        const SizedBox(height: tertiarySizedBox),
                        tabContents[selectedIndex],
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
