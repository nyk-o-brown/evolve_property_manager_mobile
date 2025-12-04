import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropertyUnitsScreen extends StatelessWidget {
  final String propertyId;

  const PropertyUnitsScreen({
    Key? key,
    required this.propertyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Units'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          '/dashboard/properties/$propertyId/units/create',
        ),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apartment,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No units yet',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a new unit to get started',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
