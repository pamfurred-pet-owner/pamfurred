import 'package:flutter/material.dart';
import 'package:pamfurred/components/bottom_navbar.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/custom_padded_button.dart';
import 'package:pamfurred/components/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                                  // Date & time
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
                                  // Service provider name
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
                      // Add logic here
                      onPressed: () {},
                      child: customPaddedTextButton(
                          text: "View appointments",
                          // Add logic here as well
                          onPressed: () {}))
                ]),
                const SizedBox(height: secondarySizedBox),
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
                          SizedBox(
                            height: 350,
                            width: MediaQuery.of(context).size.width / 2 - 24,
                            child: Card(
                              color: lightGreyColor,
                              child: Stack(children: [
                                const Positioned(
                                  top: 32,
                                  left: 16,
                                  width: 100,
                                  child: Text("Veterinary service",
                                      style: TextStyle(fontSize: regularText)),
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
                          const SizedBox(width: primarySizedBox),
                          Column(children: [
                            SizedBox(
                              height: 167,
                              width: MediaQuery.of(context).size.width / 2 - 24,
                              child: Card(
                                color: lightGreyColor,
                                child: Stack(children: [
                                  const Positioned(
                                    top: 32,
                                    left: 16,
                                    width: 70,
                                    child: Text("Pet grooming",
                                        style:
                                            TextStyle(fontSize: regularText)),
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
                            const SizedBox(height: primarySizedBox),
                            SizedBox(
                              height: 167,
                              width: MediaQuery.of(context).size.width / 2 - 24,
                              child: Card(
                                color: lightGreyColor,
                                child: Stack(children: [
                                  const Positioned(
                                    top: 32,
                                    left: 16,
                                    width: 70,
                                    child: Text("Pet boarding",
                                        style:
                                            TextStyle(fontSize: regularText)),
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
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(height: secondarySizedBox),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            // Add logic here
                            onPressed: () {},
                            child: customPaddedTextButton(
                                text: "Submit",
                                // Add logic here as well
                                onPressed: () {}))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(context),
    );
  }
}
