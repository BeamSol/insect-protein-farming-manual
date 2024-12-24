import 'package:flutter/material.dart';

class UsageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usage Instructions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Usage Instructions for Harvested Insects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Introduction Text
            Text(
              'Once your insects have been harvested and processed, you can use them in various ways, either for your diet or further food processing. The following steps outline how to dry and grind your insects for optimal use.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),

            // Drying Process
            ListTile(
              leading: Icon(Icons.wb_sunny,
                  color: Colors.orange), // Sun icon for drying
              title: Text(
                '1. Drying the Insects',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'After harvesting, place the insects in the drying section of the machine. This section circulates warm air to remove moisture, preserving the insects and making them safe for grinding. Make sure to spread the insects evenly for efficient drying.',
              ),
            ),
            Divider(),

            // Grinding Process
            ListTile(
              leading: Icon(Icons.fastfood,
                  color: Colors.green), // Food icon for grinding
              title: Text(
                '2. Grinding the Insects',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Once dried, the insects can be ground into powder using the grinding section of the machine. Place the dried insects in the grinder and adjust the grinder settings for your preferred consistency. The powder can be used as an ingredient in protein-rich recipes.',
              ),
            ),
            Divider(),

            // Storage Instructions
            ListTile(
              leading: Icon(Icons.archive,
                  color: Colors.blue), // Archive icon for storage
              title: Text(
                '3. Storing the Powder',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'After grinding, store the insect powder in an airtight container. Keep the container in a cool, dry place, away from sunlight, to maintain its freshness and nutritional value for an extended period.',
              ),
            ),
            Divider(),

            // Final Notes
            ListTile(
              leading: Icon(Icons.check_circle_outline,
                  color: Colors.green), // Check circle icon
              title: Text(
                '4. Final Notes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Using insects as a food ingredient helps reduce food waste and contributes to a more sustainable food system. By following these instructions, you can process your insects for use in various recipes while ensuring a high-quality product.',
              ),
            ),
            Divider(),

            // Button to navigate back to RaisingInsectsScreen
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to RaisingInsectsScreen
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text('Back to Raising Insects'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
