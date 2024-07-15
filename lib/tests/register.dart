import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/screens/pin_location.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  int activeStepIndex = 0;

  // TextEditingControllers
  late Map<String, TextEditingController> controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'phoneNumber': TextEditingController(),
    'doorNo': TextEditingController(),
    'street': TextEditingController(),
    'barangay': TextEditingController(),
    'city': TextEditingController(),
    'username': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  bool _obscureText = true;

  String otp = '';
  Timer? timer;
  int countDown = 120;
  bool canResend = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void resendOTP() {
    if (canResend) {
      setState(() {
        countDown = 120;
        canResend = false;
      });
      startTimer();
    }
  }

  List<Step> stepList() => [
        Step(
          state: activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: activeStepIndex >= 0,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name and contact",
                style: TextStyle(
                  fontSize: headerText,
                  fontWeight: mediumWeight,
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "First name ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(color: primaryColor),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['firstName'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Last name ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(color: primaryColor),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['lastName'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Phone number ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(color: primaryColor),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                  height: 65,
                  child: IntlPhoneField(
                    cursorColor: Colors.black,
                    initialCountryCode: 'PH',
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            secondaryBorderRadius,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: secondaryColor),
                            borderRadius:
                                BorderRadius.circular(secondaryBorderRadius))),
                  )),
              const SizedBox(height: secondarySizedBox),
              const Text(
                "Address",
                style: TextStyle(
                  fontSize: headerText,
                  fontWeight: mediumWeight,
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              const Text(
                "Door no.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: regularText,
                ),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['doorNo'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Street ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['street'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Barangay ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['barangay'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "City ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['city'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
              const Text(
                "Pin address",
                style: TextStyle(
                  fontSize: headerText,
                  fontWeight: mediumWeight,
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Pin exact address ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: secondarySizedBox),
              ClipRRect(
                borderRadius: BorderRadius.circular(secondaryBorderRadius),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, rightToLeftRoute(const PinAddress()));
                  },
                  child: Image.asset(
                    'assets/pin_address.png',
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
            ],
          ),
        ),
        Step(
          state: activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: activeStepIndex >= 1,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Credentials",
                style: TextStyle(
                  fontSize: headerText,
                  fontWeight: mediumWeight,
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Username ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['username'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Email address ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['email'],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          secondaryBorderRadius,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius))),
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Password ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: regularText,
                    ),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: regularText,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                height: primaryTextFieldHeight,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllers['password'],
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        secondaryBorderRadius,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: secondaryColor),
                        borderRadius:
                            BorderRadius.circular(secondaryBorderRadius)),
                    suffix: IconButton(
                      icon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          )),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
            ],
          ),
        ),
        Step(
          state: activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: activeStepIndex >= 2,
          title: const Text(''),
          content: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: secondarySizedBox),
                  Text(
                    "Verify email address",
                    style: TextStyle(
                      fontSize: headerText,
                      fontWeight: mediumWeight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: tertiarySizedBox),
              Center(
                child: SizedBox(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(fontSize: regularText),
                      children: [
                        TextSpan(
                          text: "Enter the OTP sent to ",
                          style: TextStyle(
                              color: Colors.black, fontSize: regularText),
                        ),
                        TextSpan(
                          // Insert user's username here
                          text: "davidjacobs@gmail.com",
                          style: TextStyle(
                              fontSize: regularText,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                              color: Colors.black, fontSize: regularText),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
              OtpTextField(
                fieldWidth: 60,
                fieldHeight: 60,
                showFieldAsBox: true,
                borderColor: greyColor,
                borderRadius: BorderRadius.circular(primaryBorderRadius),
                focusedBorderColor: secondaryColor,
                numberOfFields: 4,
                textStyle: const TextStyle(fontSize: regularText),
              ),
              const SizedBox(height: tertiarySizedBox),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${(countDown ~/ 60).toString().padLeft(2, '0')}:${(countDown % 60).toString().padLeft(2, '0')}',
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(fontSize: regularText),
                      children: [
                        const TextSpan(
                          text: "Didn't receive OTP? ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Resend",
                          style: const TextStyle(
                            color: primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              resendOTP();
                            },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: tertiarySizedBox)
            ],
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: activeStepIndex >= 3,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name: ${controllers['firstName']?.text}'
                  ' '
                  '${controllers['LastName']?.text}'),
              Text('Phone number: ${controllers['phoneNumber']?.text}'),
              Text(
                  'Address: ${controllers['doorNo']?.text},${controllers['street']?.text},${controllers['barangay']?.text},${controllers['city']?.text}'),
              Text('Password: ${controllers['password']?.text}')
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context),
      body: Theme(
        data: ThemeData(
          canvasColor:
              Colors.transparent, // Set the background color to transparent
          colorScheme:
              Theme.of(context).colorScheme.copyWith(primary: primaryColor),
          splashColor: Colors.transparent,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: secondarySizedBox),
                    const Text(
                      "Create an account",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: titleFont,
                      ),
                    ),
                    const SizedBox(height: secondarySizedBox),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: regularText),
                        children: [
                          TextSpan(
                            text: "Fields marked with (",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ") are required.",
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: secondarySizedBox),
                  ],
                ),
              ),
              Expanded(
                child: Stepper(
                  elevation: 0,
                  type: StepperType.horizontal,
                  currentStep: activeStepIndex,
                  steps: stepList(),
                  onStepContinue: () {
                    if (activeStepIndex < (stepList().length - 1)) {
                      setState(() {
                        activeStepIndex += 1;
                      });
                    } else {
                      // Save to database
                      print('Submitted');
                    }
                  },
                  onStepCancel: () {
                    if (activeStepIndex == 0) {
                      return;
                    }

                    setState(() {
                      activeStepIndex -= 1;
                    });
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      activeStepIndex = index;
                    });
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    final isLastStep = activeStepIndex == stepList().length - 1;
                    return Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: details.onStepContinue,
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      secondaryBorderRadius),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                primaryColor,
                              ),
                            ),
                            child: (isLastStep)
                                ? const Text("Register",
                                    style: TextStyle(
                                      fontSize: regularText,
                                      color: Colors.white,
                                    ))
                                : const Text("Next",
                                    style: TextStyle(
                                      fontSize: regularText,
                                      color: Colors.white,
                                    )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (activeStepIndex > 0)
                          Expanded(
                            child: TextButton(
                              onPressed: details.onStepCancel,
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  primaryColor,
                                ),
                              ),
                              child: const Text("Back",
                                  style: TextStyle(
                                    fontSize: regularText,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
