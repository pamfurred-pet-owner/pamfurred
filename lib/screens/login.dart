import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/screens/main_screen.dart';
import 'package:pamfurred/tests/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;
  bool isLoading = false;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    checkIfUserIsLoggedIn(); // Check if user is already logged in
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/pamfurred_logo.png'), context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

// Method to check if user is already logged in
  Future<void> checkIfUserIsLoggedIn() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      // User is already logged in
      Navigator.pushReplacement(
        context,
        crossFadeRoute(const MainScreen()), // No need to pass userId
      );
    }
  }

  // Method to authenticate the user
  Future<void> authenticateUser(String email, String password) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email.trim(), // Trim whitespace from email input
        password: password.trim(),
      );

      if (response.session != null) {
        // Save session for the logged-in user
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );
        }
        // Navigate to MainScreen if authentication is successful
        if (mounted) {
          Navigator.pushReplacement(
            context,
            crossFadeRoute(const MainScreen()),
          );
        }
      }
    } on AuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = deviceWidthDivideOnePointFive(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/pamfurred_logo.png',
                            width: deviceWidth + 20,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 24),
                          // Email address field
                          SizedBox(
                            width: deviceWidth,
                            height: 50,
                            child: TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return 'Please enter email address';
                                } else {
                                  return (!EmailValidator.validate(value!))
                                      ? 'Invalid Email Address'
                                      : null;
                                }
                              },
                              cursorColor: const Color.fromRGBO(74, 74, 74, 1),
                              focusNode: emailFocusNode,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              readOnly: isLoading, // Disable input when loading
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                prefixIcon: const Icon(Icons.person, size: 19),
                                labelText: emailFocusNode.hasFocus
                                    ? ''
                                    : 'Email address',
                                labelStyle:
                                    const TextStyle(fontSize: regularText),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(241, 241, 241, 1.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      secondaryBorderRadius),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: const TextStyle(fontSize: regularText),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Password field
                          SizedBox(
                            width: deviceWidth,
                            height: 50,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor: const Color.fromRGBO(74, 74, 74, 1),
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                              obscureText: obscureText,
                              validator: (value) {
                                return (value == '')
                                    ? 'Please enter password'
                                    : null;
                              },
                              readOnly: isLoading, // Disable input when loading
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                prefixIcon: Transform.rotate(
                                  angle: 40,
                                  child: const Icon(Icons.key, size: 19),
                                ),
                                labelText: passwordFocusNode.hasFocus
                                    ? ''
                                    : 'Password',
                                labelStyle:
                                    const TextStyle(fontSize: regularText),
                                suffix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: (() {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      }),
                                      child: Icon(
                                        obscureText
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 19,
                                      ),
                                    )
                                  ],
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(241, 241, 241, 1.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      secondaryBorderRadius),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: const TextStyle(fontSize: regularText),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: deviceWidth,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(
                                  fontSize: regularText,
                                  color: secondaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: deviceWidth,
                            height: 50,
                            child: TextButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      if (formKey.currentState!.validate()) {
                                        await authenticateUser(
                                          emailController.text,
                                          passwordController.text,
                                        );
                                      }
                                    },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        secondaryBorderRadius),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    primaryColor),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: regularText,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: deviceWidth,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(fontSize: regularText),
                                children: [
                                  const TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Register",
                                    style: const TextStyle(color: primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            rightToLeftRoute(
                                                const RegisterScreen()));
                                      },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontSize: regularText),
                        children: [
                          TextSpan(text: "About Pamfurred"),
                          TextSpan(text: " • "),
                          TextSpan(text: "Privacy Policy"),
                          TextSpan(text: " • "),
                          TextSpan(text: "Terms of Service"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
