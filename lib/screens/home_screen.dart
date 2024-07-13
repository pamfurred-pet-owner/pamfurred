import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/custom_padded_button.dart';
import 'package:pamfurred/components/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  int selectedIndex = -1; // No service category selected initially

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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Upcoming appointments",
                          style: TextStyle(
                              fontSize: headerText, fontWeight: mediumWeight)),
                    ],
                  ),
                  const SizedBox(height: primarySizedBox),
                  const Card(
                    elevation: 1.5,
                    color: Color.fromRGBO(255, 246, 228, 1),
                    child: SizedBox(
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
                const Row(
                  children: [
                    Text("I'm looking for",
                        style: TextStyle(
                            fontSize: headerText, fontWeight: mediumWeight))
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
                              child: Stack(children: [
                                SizedBox(
                                  height: 167,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      24,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: Card(
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
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                if (selectedIndex == 1) selectedServiceCategory()
                              ]),
                            ),
                            const SizedBox(height: primarySizedBox),
                            GestureDetector(
                              onTap: () => onItemTap(2),
                              child: Stack(children: [
                                SizedBox(
                                  height: 167,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      24,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: Card(
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
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                if (selectedIndex == 2) selectedServiceCategory()
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
                                text: "Submit", onPressed: () {}))
                      ],
                    )
                  ],
                ),
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
}