import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/header.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/screens/email_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase package

import '../components/globals.dart';

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

    controllers = {
      'firstName': TextEditingController(),
      'lastName': TextEditingController(),
      'email': TextEditingController(),
      'password': TextEditingController(),
      'phoneNumber': TextEditingController(), // Added contact number controller
      'username': TextEditingController(), // Added username controller
    };
  }

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildTextField(String label, String controllerKey,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "$label ",
              style:
                  const TextStyle(color: Colors.black, fontSize: regularText),
            ),
            const TextSpan(
              text: "*",
              style: TextStyle(color: primaryColor),
            ),
          ]),
        ),
        const SizedBox(height: primarySizedBox),
        SizedBox(
          height: primaryTextFieldHeight,
          child: TextFormField(
            controller: controllers[controllerKey],
            obscureText: isPassword ? _obscureText : false,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(secondaryBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: secondaryColor),
                borderRadius: BorderRadius.circular(secondaryBorderRadius),
              ),
              suffix: isPassword
                  ? IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    final email = controllers['email']?.text ?? '';
    final password = controllers['password']?.text ?? '';
    final firstName = controllers['firstName']?.text ?? '';
    final lastName = controllers['lastName']?.text ?? '';
    final phoneNumber = controllers['phoneNumber']?.text ?? '';
    final username = controllers['username']?.text ?? '';

    try {
      // Call Supabase Auth to sign up the user with email and password
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'username': username,
        },
      );

      if (response.user != null) {
        // User registered successfully, now add additional info to the pet_owner table first
        final petOwnerResponse =
            await Supabase.instance.client.from('pet_owner').insert({
          'username': username,
          'user_id': response.user!
              .id, // Ensure you pass the user_id to associate the pet owner
        }); // Execute the query to get the response

        if (petOwnerResponse.error == null) {
          // Proceed to insert into the user table
          final userResponse =
              await Supabase.instance.client.from('user').insert({
            'user_id': response.user!.id,
            'first_name': firstName,
            'last_name': lastName,
            'email_address': email,
            'phone_number': phoneNumber,
            'username': username,
            'user_type': 'pet_owner',
          }); // Execute the query to get the response

          if (userResponse.error == null) {
            // Both insertions successful, navigate to OTPAuth screen
            if (mounted) {
              Navigator.push(context, rightToLeftRoute(const EmailAuth()));
            }
          } else {
            // Handle user insertion error
            final error = userResponse.error?.message ?? "Unknown error";
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error inserting user: $error")),
              );
            }
          }
        } else {
          // Handle pet owner insertion error
          final error = petOwnerResponse.error?.message ?? "Unknown error";
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error inserting pet owner: $error")),
            );
          }
        }
      } else {
        // Handle registration error
        final error = response.error?.message ?? "Unknown error";
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration failed: $error")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionHeader("Create an account"),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: regularText),
                  children: [
                    TextSpan(
                      text: "Fields marked with (",
                      style: TextStyle(color: greyColor),
                    ),
                    TextSpan(
                      text: "*",
                      style: TextStyle(color: primaryColor),
                    ),
                    TextSpan(
                      text: ") are required.",
                      style: TextStyle(color: greyColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: secondarySizedBox),
              customTitleText(context, "Name"),
              const SizedBox(height: secondarySizedBox),
              Row(
                children: [
                  Expanded(child: _buildTextField("First name", "firstName")),
                  const SizedBox(width: primarySizedBox),
                  Expanded(child: _buildTextField("Last name", "lastName")),
                ],
              ),
              const SizedBox(height: secondarySizedBox),
              customTitleText(context, "Credentials"),
              const SizedBox(height: secondarySizedBox),
              Row(
                children: [
                  Expanded(
                      child: _buildTextField(
                          "Username", "username")), // Username field added here
                ],
              ),
              const SizedBox(height: secondarySizedBox),
              Row(
                children: [
                  Expanded(child: _buildTextField("Email address", "email")),
                ],
              ),
              const SizedBox(height: secondarySizedBox),
              Row(
                children: [
                  Expanded(
                      child: _buildTextField("Password", "password",
                          isPassword: true)),
                ],
              ),
              const SizedBox(height: secondarySizedBox),
              Row(
                children: [
                  Expanded(
                      child: _buildTextField("Phone Number", "phoneNumber")),
                ],
              ),
              const SizedBox(height: tertiarySizedBox),
              Center(
                child: SizedBox(
                  width: deviceWidth,
                  height: primaryTextFieldHeight,
                  child: TextButton(
                    onPressed: _isLoading
                        ? null
                        : _registerUser, // Disable while loading
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(secondaryBorderRadius),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(primaryColor),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Log in",
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
            ],
          ),
        ),
      ),
    );
  }
}

extension on AuthResponse {
  get error => null;
}
