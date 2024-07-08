import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pamfurred/otp_auth.dart';
import 'globals.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  late Map<String, TextEditingController> controllers;

  @override
  void initState() {
    super.initState();

    // TextEditingControllers
    controllers = {
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
  }

  bool _obscureText = true;

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = deviceWidthDivideOnePointFive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: primaryPadding,
          child: Column(
            children: [
              Column(
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
                  const Text(
                    "Name and Contact",
                    style: TextStyle(
                      fontSize: headerText,
                      fontWeight: mediumWeight,
                    ),
                  ),
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: primarySizedBox,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  const SizedBox(height: secondarySizedBox),
                  SizedBox(
                      height: 65,
                      child: IntlPhoneField(
                        // Not quite sure yet about the country code
                        initialCountryCode: 'PH',
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                secondaryBorderRadius,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: secondaryColor),
                                borderRadius: BorderRadius.circular(
                                    secondaryBorderRadius))),
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                controller: controllers['doorNo'],
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: primarySizedBox,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                controller: controllers['street'],
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                controller: controllers['barangay'],
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                controller: controllers['city'],
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: secondarySizedBox),
                  const Text(
                    "Credentials",
                    style: TextStyle(
                      fontSize: headerText,
                      fontWeight: mediumWeight,
                    ),
                  ),
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                controller: controllers['username'],
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                controller: controllers['email'],
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: secondaryColor),
                                        borderRadius: BorderRadius.circular(
                                            secondaryBorderRadius))),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: secondarySizedBox),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      borderSide: const BorderSide(
                                          color: secondaryColor),
                                      borderRadius: BorderRadius.circular(
                                          secondaryBorderRadius)),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: tertiarySizedBox),
                  Center(
                    child: SizedBox(
                        width: deviceWidth,
                        height: primaryTextFieldHeight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, rightToLeftRoute(const OTPAuth()));
                          },
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    secondaryBorderRadius),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              primaryColor,
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white, fontSize: regularText),
                          ),
                        )),
                  ),
                  const SizedBox(height: tertiarySizedBox),
                  Center(
                    child: SizedBox(
                      width: deviceWidth,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(fontSize: regularText),
                          children: [
                            const TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                color: primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: tertiarySizedBox),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
