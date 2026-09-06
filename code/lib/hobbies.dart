import 'package:flutter/material.dart';

class HobbiesPage extends StatelessWidget {
  const HobbiesPage({super.key});

  // Sample data to match your image list
  final List<String> hobbies = const [
    'Coding Flutter Apps',
    'Playing Video Games',
    'Reading Sci-Fi Books',
    'Photography',
    'Playing Basketball',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF), // Light background color
      appBar: AppBar(
        title: const Text('My Hobbies'),
        backgroundColor: Colors.blue, // Matching the blue header
        foregroundColor: Colors.black87, // Darker text color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handles the back button click
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: hobbies.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(
                    0xFFEADBFF,
                  ), // Soft purple circle background
                  child: Text(
                    '${index + 1}', // Dynamic numbering (1, 2, 3...)
                    style: const TextStyle(
                      color: Color(0xFF65558F), // Deep purple number color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  hobbies[index],
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () {
                  // Define your click action for each hobby here
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
