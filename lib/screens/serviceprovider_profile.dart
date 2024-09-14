import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/regular_text.dart';
import 'package:pamfurred/components/title_text.dart';
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

    // Service options
    final serviceOptions = ref.watch(serviceOptionsProvider);

    // State providers for filtering
    final selectedServiceType = ref.watch(serviceTypeProvider);
    final selectedPetType = ref.watch(petTypeProvider);
    final selectedServiceCategory = ref.watch(selectedServiceCategoryProvider);

    // Filtered services based on selection
    final allServices = ref.watch(servicesProvider);

    final filteredServices = allServices.where((service) {
      final matchesPetType = service.petType.contains(selectedPetType);
      final matchesServiceCategory =
          service.category == selectedServiceCategory;
      final matchesSelectedServiceType =
          service.serviceType.contains(selectedServiceType);
      return matchesPetType &&
          matchesServiceCategory &&
          matchesSelectedServiceType;
    }).toList();

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
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: 2, itemBuilder: (context, index) {}))
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              return Container(
                                height: 180,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(tertiaryBorderRadius),
                                      topRight: Radius.circular(
                                          tertiaryBorderRadius)),
                                  color: lighterGreyColor,
                                ),
                                child: ListView.builder(
                                  itemCount: serviceOptions.length,
                                  itemBuilder: (context, index) {
                                    final option = serviceOptions[index];
                                    return ListTile(
                                      title: Text(option),
                                      onTap: () {
                                        ref
                                            .read(
                                                selectedServiceCategoryProvider
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
                              selectedServiceCategory,
                              style: const TextStyle(fontSize: regularText),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 230,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: secondarySizedBox),
                                customTitleText(context, 'Pet Type'),
                                const SizedBox(height: secondarySizedBox),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomRadioButton(
                                      buttonLables: const [
                                        'Dog',
                                        'Cat',
                                        'Rabbit'
                                      ],
                                      buttonValues: const [
                                        'Dog',
                                        'Cat',
                                        'Rabbit'
                                      ],
                                      radioButtonValue: (value) =>
                                          // Updating pet type
                                          {
                                        ref
                                            .read(petTypeProvider.notifier)
                                            .updatePetType(value)
                                      },
                                      defaultSelected:
                                          ref.watch(petTypeProvider),
                                      selectedColor: primaryColor,
                                      unSelectedColor: Colors.transparent,
                                      elevation: 0,
                                      enableShape: true,
                                      buttonTextStyle: const ButtonTextStyle(
                                          textStyle:
                                              TextStyle(fontSize: regularText)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: secondarySizedBox),
                                customTitleText(context, 'Service Type'),
                                const SizedBox(height: secondarySizedBox),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomRadioButton(
                                      buttonLables: const [
                                        'Home service',
                                        'In-clinic'
                                      ],
                                      buttonValues: const [
                                        'Home service',
                                        'In-clinic'
                                      ],
                                      radioButtonValue: (value) =>
                                          // Updating service type
                                          {
                                        ref
                                            .read(serviceTypeProvider.notifier)
                                            .updateServiceType(value)
                                      },
                                      defaultSelected:
                                          ref.watch(serviceTypeProvider),
                                      selectedColor: primaryColor,
                                      unSelectedColor: Colors.transparent,
                                      elevation: 0,
                                      enableShape: true,
                                      buttonTextStyle: const ButtonTextStyle(
                                          textStyle:
                                              TextStyle(fontSize: regularText)),
                                      width: 150,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.filter_list,
                      color: primaryColor,
                      size: 25,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: tertiarySizedBox,
              ),
              filteredServices.isEmpty
                  ? const Center(
                      child: Text("No services available"),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: filteredServices.length,
                        itemBuilder: (context, index) {
                          final service = filteredServices[index];
                          return Card(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(primaryBorderRadius),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      primaryBorderRadius),
                                  child: SizedBox(
                                    width: 90,
                                    height: 85,
                                    child: Image.network(
                                      service.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error,
                                            size: 70);
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        tertiarySizedBox), // Adjust spacing as needed
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customTitleText(context, service.name),
                                      Text('₱${service.price}'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 37,
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: secondaryColor,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                        onPressed: () {
                                          // Handle add action
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Container(
                    color: lighterGreyColor,
                    width: double.infinity,
                    height: 150,
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                  );
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
            Icon(icon, size: 20, color: const Color.fromARGB(255, 26, 10, 10)),
            const SizedBox(width: secondarySizedBox),
            regularGreyTextWidget(detail),
          ],
        ),
        const SizedBox(height: secondarySizedBox),
      ],
    );
  }
}

// Radio button class

class RadioGroup extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;

  const RadioGroup({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ...options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedOption,
            onChanged: (value) {
              print("Selected option: $value"); // Debugging line
              onChanged(value); // Trigger state update
            },
          );
        }),
      ],
    );
  }
}
