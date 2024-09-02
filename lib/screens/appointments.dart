import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/globals.dart';
import '../providers/appointment_provider.dart'; // Import Riverpod provider

class AppointmentsScreen extends ConsumerStatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  AppointmentsScreenState createState() => AppointmentsScreenState();
}

class AppointmentsScreenState extends ConsumerState<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<bool> _showBadge;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _showBadge = List.generate(5, (index) => true);

    // Fetch appointments on widget initialization
    Future.microtask(() {
      ref.read(appointmentProvider.notifier).fetchAppointments();
    });

    _tabController.addListener(() {
      setState(() {
        _showBadge[_tabController.index] = false;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 20,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            _buildTabWithBadge('Today', _showBadge[0]),
            _buildTabWithBadge('Upcoming', _showBadge[1]),
            _buildTabWithBadge('All', _showBadge[2]),
            _buildTabWithBadge('Done', _showBadge[3]),
            _buildTabWithBadge('Cancelled', _showBadge[4]),
          ],
          labelColor: tangerine,
          indicatorColor: tangerine,
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(5, (index) => _buildAppointmentList()),
      ),
    );
  }

  Widget _buildTabWithBadge(String text, bool showBadge) {
    return Tab(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5),
        showBadge: showBadge,
        badgeStyle: const badges.BadgeStyle(badgeColor: tangerine),
        child: Text(text),
      ),
    );
  }

  Widget _buildAppointmentList() {
    final appointmentList =
        ref.watch(appointmentProvider); // Watch appointments

    if (appointmentList.isEmpty) {
      return const Center(child: Text('No Appointments Available'));
    }

    return ListView.builder(
      itemCount: appointmentList.length,
      itemBuilder: (context, index) {
        final appointment = appointmentList[index];
        return Card(
          child: ListTile(
            title: Text(appointment.appointmentDate),
            subtitle: Text(appointment.status),
          ),
        );
      },
    );
  }
}
