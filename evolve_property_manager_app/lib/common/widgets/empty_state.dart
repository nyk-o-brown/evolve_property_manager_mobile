import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? actionOnPressed;
  final String? actionLabel;

  const EmptyState({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionOnPressed,
    this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (actionOnPressed != null && actionLabel != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: actionOnPressed,
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
