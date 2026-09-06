import 'package:flutter/material.dart';

class PicturesPage extends StatelessWidget {
  const PicturesPage({super.key});

  // Explicit shade palette matching your image grid items
  final List<Color> gridColors = const [
    Color(0xFFBAD6F7), // Picture 1 (Lightest blue)
    Color(0xFF90C2F9), // Picture 2
    Color(0xFF64B0F7), // Picture 3
    Color(0xFF42A1F5), // Picture 4 (Darkest blue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favorite Pics'),
        backgroundColor: const Color(0xFF2196F3), // Solid material blue header
        foregroundColor: Colors.black87, // Dark title text
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous hobbies page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0), // Outer margins around the grid
        child: GridView.count(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 12.0, // Space between columns
          mainAxisSpacing: 12.0, // Space between rows
          children: List.generate(4, (index) {
            return InkWell(
              onTap: () {
                // Handle image click events here
              },
              child: Container(
                color: gridColors[index],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image, size: 48, color: Colors.white),
                    const SizedBox(height: 8),
                    Text(
                      'Picture ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
