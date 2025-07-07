import 'package:flutter/material.dart';
import 'package:setupapp/constants/app_images.dart';

class PaymentSlip extends StatelessWidget {
  const PaymentSlip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Card
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                    left: 16,
                    right: 16,
                  ),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 244, 244),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Transaction Saved Successfully!',
                        textAlign: TextAlign.center,

                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: const [
                            PartInfo(),
                            Divider(color: Color.fromARGB(255, 234, 231, 231)),
                            RowText(text: 'United State', value: 33),
                            RowText(text: 'Saodia Arbia', value: 33),
                            RowText(text: 'Bangladesh', value: 33),
                            Divider(color: Color.fromARGB(255, 234, 231, 231)),
                            RowText(text: 'Total Amount', value: 222),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Floating icon
                Positioned(
                  top: 0,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.white,
                    child: Image.asset(AppImages.checkmark),
                  ),
                ),
              ],
            ),
          ),
          ButtonRow(),
        ],
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String text;
  final double value;
  const RowText({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(
            value.toStringAsFixed(2),
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class PartInfo extends StatelessWidget {
  const PartInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.person, color: Colors.teal, size: 24),
      ),
      title: const Text(
        "Abir Vai",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: const Text(
        '+8801623435267',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Add print functionality here
          },
          icon: const Icon(Icons.home),
          label: const Text('Back to Home'),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 246, 244, 244),
            foregroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Add print functionality here
          },
          icon: const Icon(Icons.print),
          label: const Text('Share Now'),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 246, 244, 244),
            foregroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}