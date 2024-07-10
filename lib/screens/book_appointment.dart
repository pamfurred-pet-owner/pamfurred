import 'package:flutter/material.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Custom Content Widget',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class SteperItemSection extends StatefulWidget {
  final Widget contentWidget;
  const SteperItemSection({super.key, required this.contentWidget});

  @override
  State<SteperItemSection> createState() => _SteperItemSectionState();
}



class _SteperItemSectionState extends State<SteperItemSection> {
  int currentStep = 0;

  List<Map<String, String>> steplist = [
    {'task': '1', 'content': "Step 1"},
    {'task': '2', 'content': "Step 2"},
    {'task': '3', 'content': "Step 3"},
    {'task': '4', 'content': "Step 4"},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double stepperHeight = constraints.maxHeight;
        double stepperWidth = constraints.maxWidth;

        return SingleChildScrollView(
          child: SizedBox(
            height: stepperHeight * 0.9, // Adjust as needed
            width: stepperWidth,
            child: Stepper(
              physics: const NeverScrollableScrollPhysics(),
              connectorThickness: 1,
              elevation: 0,
              type: StepperType.horizontal,
              currentStep: currentStep,
              controlsBuilder: (BuildContext context, ControlsDetails controls) {
                return const Row(
                  children: <Widget>[
                    SizedBox.shrink(),
                  ],
                );
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
              steps: getSteps(),
            ),
          ),
        );
      },
    );
  }

  void commonOnTap() {
    bool isLastStep = (currentStep == getSteps().length - 1);
    if (isLastStep) {
      //Do something with this information
    } else {
      setState(() {
        currentStep += 1;
      });
    }
  }

  final double fontSize = 8;
  List<Step> getSteps() {
    var itemList = steplist.asMap().entries.map<Step>((e) {
      var i = e.key;
      var item = e.value;
      return Step(
        state: currentStep > i ? StepState.complete : StepState.indexed,
        isActive: currentStep >= i,
        title: const SizedBox.shrink(),
        label: Text(
          StepState.indexed == StepState.indexed ? item['content'] ?? "" : "",
          style: TextStyle(
              fontSize: fontSize,
              color: currentStep >= i ? Colors.blue : null),
        ),
        content: widget.contentWidget,
      );
    });
    return itemList.toList();
  }
}
