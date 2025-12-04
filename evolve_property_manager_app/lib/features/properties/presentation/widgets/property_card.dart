import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String address;
  final int totalUnits;
  final double monthlyIncome;
  final String? imageUrl;
  final VoidCallback onTap;

  const PropertyCard({
    Key? key,
    required this.title,
    required this.address,
    required this.totalUnits,
    required this.monthlyIncome,
    required this.onTap,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(Icons.house, size: 48),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$totalUnits units',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        '\$${monthlyIncome.toStringAsFixed(2)}/mo',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
