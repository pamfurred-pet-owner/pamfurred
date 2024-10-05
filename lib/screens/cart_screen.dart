import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:pamfurred/components/screen_transitions.dart';
import 'package:pamfurred/providers/cart_provider.dart';
import 'package:pamfurred/screens/successful_appointment.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    // Watch cart products and total price from the providers
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);

    const double buttonHeight = 50;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarWithTitle(context, "Your Cart"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(
            20, 20, 20, 0), // Add some padding around the FAB
        child: Container(
          width: double.infinity,
          height: 124,
          decoration: BoxDecoration(
            color: Colors.white, // Set background color to white
            borderRadius:
                BorderRadius.circular(secondaryBorderRadius), // Rounded corners
          ),
          padding: const EdgeInsets.all(20.0), // Padding inside the container
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // First Row: Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: boldWeight,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '₱$total',
                    style: const TextStyle(
                      fontSize: titleFont,
                      fontWeight: boldWeight,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: secondarySizedBox), // Space between total and button

              // Second Row: Order Now button
              SizedBox(
                width: double.infinity, // Full width button
                height: buttonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          secondaryBorderRadius), // Rounded corners
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        rightToLeftRoute(const SuccessfulAppointment()));
                  },
                  child: const Text(
                    'Book now',
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: boldWeight,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display cart items
            Expanded(
              child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  final item = cartProducts.elementAt(index);
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(primaryBorderRadius),
                          child: Image.network(
                            item.image,
                            width: 90,
                            height: 85,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 90,
                                height: 85,
                                color: Colors
                                    .grey[300], // Fallback background color
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          '₱${item.price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
