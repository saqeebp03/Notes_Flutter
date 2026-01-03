import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.notes, size: 80, color: Colors.grey),
          SizedBox(height: 24),
          Text(
            'No notes yet!',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the + button to add your first note.',
            style: TextStyle(fontSize: 16, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}

