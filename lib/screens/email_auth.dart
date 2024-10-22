import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/screens/successful_registration.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase import

import '../components/globals.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => EmailAuthState();
}

class EmailAuthState extends State<EmailAuth> {
  bool _isLoading = false;
  Timer? _timer;
  int _counter = 60;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
    _sendOtpEmail(); // Send OTP to user's email on load
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  // Start the timer for countdown to resend the OTP email
  void _startTimer() {
    _counter = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  // Resend the OTP verification email
  Future<void> _sendOtpEmail() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final session = Supabase.instance.client.auth.currentSession;
      final user = session?.user;

      if (user != null) {
        await Supabase.instance.client.auth.signInWithOtp(email: user.email!);
        setState(() {
          _counter = 60; // Restart the timer
          _startTimer();
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP email sent! Check your inbox.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending OTP email: $e')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Verify the OTP entered by the user
  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final otp = _otpController.text.trim();

      if (otp.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please enter the OTP sent to your email.')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final response = await Supabase.instance.client.auth.verifyOTP(
        email: Supabase.instance.client.auth.currentSession!.user.email!,
        token: otp,
        type: OtpType.email, // Specify that this is an email OTP verification
      );

      if (response.user != null) {
        // If OTP is verified, redirect to the SuccessfulRegistration screen
        if (mounted) {
          Navigator.push(
            context,
            rightToLeftRoute(const SuccessfulRegistration()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error verifying OTP: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: primaryPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the OTP sent to your email to verify your account.',
              style:
                  TextStyle(fontSize: regularText, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: secondarySizedBox),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: secondarySizedBox),
            Center(
              child: ElevatedButton(
                onPressed:
                    _isLoading ? null : _verifyOtp, // Verify OTP on press
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Verify OTP',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: secondarySizedBox),
            Center(
              child: Text(
                'Resend OTP in $_counter seconds',
                style: const TextStyle(color: greyColor),
              ),
            ),
            const SizedBox(height: secondarySizedBox),
            Center(
              child: TextButton(
                onPressed: _counter == 0 ? _sendOtpEmail : null,
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
