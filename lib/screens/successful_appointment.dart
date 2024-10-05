import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_padded_button.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/components/title_text.dart';
import 'package:pamfurred/screens/home_screen.dart';
import '../components/globals.dart';

class SuccessfulAppointment extends ConsumerWidget {
  const SuccessfulAppointment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/pamfurred_logo.png',
                      width: 325,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: tertiarySizedBox),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/check.png',
                      width: 175,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: tertiarySizedBox),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customRegularWeightTitleText(context, 'Appointment ID:'),
                  const SizedBox(
                    width: primarySizedBox,
                  ),
                  customTitleText(context, '1234'),
                ],
              ),
              const SizedBox(height: tertiarySizedBox),
              SizedBox(
                width: screenPadding(context),
                child: Column(
                  children: [
                    getAppointmentTitle(context, 'Service provider'),
                    const SizedBox(height: primarySizedBox),
                    getAppointmentDetail(context, 'Service provider name'),
                    const SizedBox(height: secondarySizedBox),
                    getAppointmentTitle(context, 'Date and time'),
                    const SizedBox(height: primarySizedBox),
                    getAppointmentDetail(context, 'Appointment date and time'),
                    const SizedBox(height: secondarySizedBox),
                    getAppointmentTitle(context, 'Pet'),
                    const SizedBox(height: primarySizedBox),
                    getAppointmentDetail(context, 'Pet name'),
                    const SizedBox(height: secondarySizedBox),
                    getAppointmentTitle(context, 'Service type'),
                    const SizedBox(height: primarySizedBox),
                    getAppointmentDetail(context, 'Service type name'),
                  ],
                ),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                width: screenPadding(context),
                child: Column(
                  children: [
                    getAppointmentTitle(context, 'Services'),
                    const SizedBox(height: primarySizedBox),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAppointmentDetail(context, 'Service name'),
                        getAppointmentTitle(context, 'Price'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: primarySizedBox),
              SizedBox(
                width: screenPadding(context),
                child: Column(
                  children: [
                    getAppointmentTitle(context, 'Packages'),
                    const SizedBox(height: primarySizedBox),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAppointmentDetail(context, 'Package name'),
                        getAppointmentTitle(context, 'Price'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: tertiarySizedBox),
              Center(
                child: customPaddedTextButton(
                    text: 'Return to dashboard',
                    onPressed: () {
                      Navigator.push(
                          context, crossFadeRoute(const HomeScreen()));
                    }),
              )
            ],
          ))
        ],
      ),
    );
  }

  getAppointmentTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        customTitleText(context, title),
        const SizedBox(
          width: primarySizedBox,
        ),
      ],
    );
  }

  getAppointmentDetail(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        customRegularWeightTitleText(context, title),
        const SizedBox(
          width: primarySizedBox,
        ),
      ],
    );
  }
}
