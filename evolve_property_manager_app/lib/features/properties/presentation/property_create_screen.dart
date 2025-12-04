import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropertyCreateScreen extends StatefulWidget {
  const PropertyCreateScreen({Key? key}) : super(key: key);

  @override
  State<PropertyCreateScreen> createState() => _PropertyCreateScreenState();
}

class _PropertyCreateScreenState extends State<PropertyCreateScreen> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipController;
  late TextEditingController _unitsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _zipController = TextEditingController();
    _unitsController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _unitsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Property')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Property Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _stateController,
              decoration: const InputDecoration(
                labelText: 'State',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _zipController,
              decoration: const InputDecoration(
                labelText: 'ZIP Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _unitsController,
              decoration: const InputDecoration(
                labelText: 'Total Units',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create property
                context.go('/dashboard/properties');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Create Property'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.go('/dashboard/properties'),
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
