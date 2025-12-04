import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnitCreateScreen extends StatelessWidget {
  final String propertyId;

  const UnitCreateScreen({
    Key? key,
    required this.propertyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Unit')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Unit Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.meeting_room),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Monthly Rent Price',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'vacant', child: Text('Vacant')),
                DropdownMenuItem(value: 'occupied', child: Text('Occupied')),
              ],
              onChanged: (value) {
                // Handle status change
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create unit
                context.go('/dashboard/properties/$propertyId/units');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Create Unit'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                context.go('/dashboard/properties/$propertyId/units');
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
