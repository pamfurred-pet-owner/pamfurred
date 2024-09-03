import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/regular_text.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/providers/sp_tab_provider.dart';

class ServiceproviderProfileScreen extends ConsumerWidget {
  const ServiceproviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the selected tab index from the provider
    final selectedIndex = ref.watch(selectedTabProvider);

    // List of contents for each tab
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
    // List of contents for each tab
    final List<Widget> tabContents = [
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
      )),
      Center(child: regularTextWidget("Services")),
      Center(child: regularTextWidget("Packages")),
    ];
    return SafeArea(
      child: Scaffold(
          appBar: customAppBar(context),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: primarySizedBox),
                // Replace data of service provider details
                SizedBox(
                  width: screenPadding(context),
                  child: Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://tinyurl.com/yxxv7523",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: secondarySizedBox),
                        customTitleTextWithPrimaryColor(
                            context, "Paws and Claws Pet Station"),
                      ],
                    ),
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
                        Container(
                          child: tabContents[
                              selectedIndex], // Display content based on selected index
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(height: primarySizedBox),
                SizedBox(
                  width: screenPadding(context),
                )
              ],
            ),
          )),
    );
  }

  spDetailsHeader(IconData icon, String detail) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: secondarySizedBox), //Spacing below the container
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black, // Set border color
            width: .15, // Set border width
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon as IconData?, size: 20, color: Colors.black),
          const SizedBox(width: secondarySizedBox),
          regularGreyTextWidget(detail),
        ],
      ),
    );
  }
}
