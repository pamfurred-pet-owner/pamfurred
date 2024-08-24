import 'package:flutter/material.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/title_text.dart';

enum SingingCharacter { vetService, petBoarding, petGrooming }

enum Priority { location, priceRange }

class EditPreferencesScreen extends StatefulWidget {
  final int index;
  const EditPreferencesScreen({super.key, required this.index});

  @override
  State<EditPreferencesScreen> createState() => _EditPreferencesScreenState();
}

class _EditPreferencesScreenState extends State<EditPreferencesScreen> {
  late SingingCharacter _character;
  Priority? _priority; // Initialize with no default priority

  @override
  void initState() {
    super.initState();
    _character = _getCharacterFromIndex(widget.index);
  }

  SingingCharacter _getCharacterFromIndex(int index) {
    switch (index) {
      case 0:
        return SingingCharacter.vetService;
      case 1:
        return SingingCharacter.petGrooming;
      case 2:
        return SingingCharacter.petBoarding;
      default:
        return SingingCharacter.vetService;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(tertiarySizedBox),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTitleText(context, "Type of service"),
              Padding(
                padding: const EdgeInsets.all(primarySizedBox),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Radio<SingingCharacter>(
                            value: SingingCharacter.vetService,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value!;
                              });
                            },
                          ),
                          const Text(
                            'Veterinary service',
                            style: TextStyle(fontSize: regularText),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Radio<SingingCharacter>(
                            value: SingingCharacter.petGrooming,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value!;
                              });
                            },
                          ),
                          const Text(
                            'Pet grooming',
                            style: TextStyle(fontSize: regularText),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Radio<SingingCharacter>(
                            value: SingingCharacter.petBoarding,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value!;
                              });
                            },
                          ),
                          const Text(
                            'Pet boarding',
                            style: TextStyle(fontSize: regularText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: primarySizedBox),
              customTitleText(context, "Priority"),
              const SizedBox(height: primarySizedBox),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 35,
                    child: Row(
                      children: [
                        Radio<Priority>(
                          value: Priority.location,
                          groupValue: _priority,
                          onChanged: (Priority? value) {
                            setState(() {
                              _priority = value;
                            });
                          },
                        ),
                        const Text(
                          'Location',
                          style: TextStyle(fontSize: regularText),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      children: [
                        Radio<Priority>(
                          value: Priority.priceRange,
                          groupValue: _priority,
                          onChanged: (Priority? value) {
                            setState(() {
                              _priority = value;
                            });
                          },
                        ),
                        const Text(
                          'Price range',
                          style: TextStyle(fontSize: regularText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
