import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/regular_text.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/sp_profile_provider_services.dart';
import 'package:pamfurred/providers/sp_tab_provider.dart';

class ServiceproviderProfileScreen extends ConsumerWidget {
  final String imageUrl;
  const ServiceproviderProfileScreen(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTabProvider);
    const defaultImage = 'https://tinyurl.com/3tnt6yyy';

    final allServices = ref.watch(servicesProvider);
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
        child: SizedBox(
          height: getScreenHeight(context) - 395,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customTitleText(context, "Grooming services"),
                ],
              ),
              SizedBox(
                height: getScreenHeight(context) - 421,
                child: ListView.builder(
                  itemCount: allServices.length,
                  itemBuilder: (context, index) {
                    final service = allServices[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            service.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error,
                                  size: 60, color: Colors.red);
                            },
                          ),
                        ),
                        title: Text(
                          service.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('₱${service.price}'),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.add, color: primaryColor),
                            onPressed: () {
                              // Handle add action
                              // Example: ref.read(cartNotifierProvider.notifier).addProduct(service);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
        body: Center(
          child: Column(
            children: [
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
                    customTitleTextWithPrimaryColor(
                        context, "Paws and Claws Pet Station"),
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
                        const SizedBox(height: tertiarySizedBox),
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
