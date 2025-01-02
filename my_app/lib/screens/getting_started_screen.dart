import 'package:flutter/material.dart';
import 'raising_insects_screen.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Text(
              'Getting Started',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Introductory Text
            Text(
              'Follow these steps to set up your machine:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),

            // Steps List with Descriptions
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      'Unbox the machine and place it in a well-ventilated area.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Carefully unpack the machine and choose a spot with good airflow to ensure proper functioning and safety.',
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      'Ensure the machine is on a stable, flat surface.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Place the machine on a steady and level surface to avoid vibration or movement during operation.',
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      'Place the insects in their appropriate place in the machine, then start feeding and raising them.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'The machine manages the insects through their lifecycle:\n\n'
                      'Ensure the machine is cleaned regularly and settings like temperature, humidity, and feeding schedules are optimized for the insect species.',
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.warning, color: Colors.orange),
                    title: Text(
                      'Always follow safety precautions when handling live insects.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Handling live insects requires caution to avoid injury or contamination. Here are some important rules:\n\n'
                      '- Wear protective gloves: Use gloves to protect your hands and prevent contamination.\n'
                      '- Avoid direct contact: Handle insects gently using designated tools such as tweezers or scoops.\n'
                      '- Wash your hands: Always wash your hands before and after handling insects to maintain hygiene.\n'
                      '- Ensure proper disposal: If any insects die, dispose of them immediately in a sealed container to prevent contamination or odor.\n'
                      '- Keep away from food: Ensure that the insects and feeding compartments are not near food preparation areas to avoid cross-contamination.',
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.blue),
                    title: Text(
                      'Refer to the user manual for troubleshooting tips.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'In case of any issues with the machine, consult the manual for detailed troubleshooting steps and solutions.',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Navigation Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RaisingInsectsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text('Next: Raising the Insects'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
