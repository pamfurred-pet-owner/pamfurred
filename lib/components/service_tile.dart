import 'package:flutter/material.dart';

// Widget for each service tile in the grid
class ServiceTile extends StatelessWidget {
  final String name;
  final String price;

  const ServiceTile({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text('Price: ₱$price', style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
