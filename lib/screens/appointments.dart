import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pamfurred/components/globals.dart';
import '../controllers/appointment_controller.dart';
import '../controllers/tab_controller.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyTabbedWidget());
  }
}

class MyTabbedWidget extends StatefulWidget {
  const MyTabbedWidget({super.key});

  @override
  MyTabbedWidgetState createState() => MyTabbedWidgetState();
}

class MyTabbedWidgetState extends State<MyTabbedWidget> {
  final MyTabController tabx = Get.put(MyTabController());
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  late List<bool> tappedStates;

  @override
  void initState() {
    super.initState();
    tappedStates = List.generate(
        appointmentController.appointments.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        bottom: TabBar(
          controller: tabx.controller,
          tabs: tabx.myTabs,
          labelColor: tangerine,
          indicatorColor: tangerine,
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
        ),
      ),
      body: TabBarView(
        controller: tabx.controller,
        children: List.generate(
          tabx.myTabs.length,
          (index) => buildAppointmentList(),
        ),
      ),
    );
  }

  // Widget to display the cards
  Widget buildAppointmentList() {
    return Obx(() {
      if (appointmentController.appointments.isEmpty) {
        return const Center(child: Text('No Appointments Available'));
      }
      return ListView.builder(
        itemCount: appointmentController.appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointmentController.appointments[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                tappedStates[index] = true; // Mark this card as tapped
              });
            },
            child: Card(
              // Display appointment details
              child: ListTile(
                title: Text(appointment.appointmentDate),
                subtitle: Text(appointment.status),
              ),
            ),
          );
        },
      );
    });
  }
}
