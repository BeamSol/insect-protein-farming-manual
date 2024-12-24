import 'package:flutter/material.dart';
import 'usage.dart'; // Import the usage.dart file

class RaisingInsectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raising the Insects'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Raising the Insects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Follow these detailed guidelines to raise healthy insects:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.bug_report, color: Colors.green),
                  title: Text(
                    '1. Choose the right type of insects.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Selecting the appropriate species of insects is crucial for successful insect farming. Commonly raised edible insects include crickets, mealworms, and black soldier flies. Each species has different requirements in terms of habitat, food, and temperature. Make sure to choose one that fits your facility and resources.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.food_bank, color: Colors.green),
                  title: Text(
                    '2. Provide organic waste for feeding.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Insects thrive on organic waste materials, such as vegetable scraps, grains, or even waste from other insects. This helps reduce food waste while providing them with a sustainable food source. Depending on the species, you may need to adjust the diet, ensuring they receive adequate protein and nutrients for healthy growth.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.thermostat, color: Colors.green),
                  title: Text(
                    '3. Maintain optimal temperature and humidity.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Temperature and humidity control is essential for raising insects. For example, mealworms require a temperature of 70-75°F (21-24°C) and humidity levels of 60-70%. Crickets prefer temperatures around 80°F (27°C) with slightly higher humidity. Use specialized equipment to maintain the right conditions, as improper climate control can lead to stress or death among the insects.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.green),
                  title: Text(
                    '4. Provide proper water and hydration.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Insects require water to stay hydrated, but too much water can cause mold and disease. A water source can be provided through moist sponges or water droplets on the walls of the enclosure. Be sure to check the water supply regularly to ensure it is clean and accessible.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.green),
                  title: Text(
                    '5. Ensure proper habitat setup.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'The insects need a secure and comfortable habitat. Crickets need a space that includes hiding places and enough space to roam. Mealworms, on the other hand, need a substrate such as oats or wheat bran where they can burrow. Regularly clean the habitat to prevent disease and avoid overcrowding.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.green),
                  title: Text(
                    '6. Regular maintenance and cleaning.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Insect enclosures must be cleaned regularly to avoid the buildup of waste that could harbor bacteria or pathogens. Clean out any uneaten food and replace the bedding or substrate frequently. Check for dead insects and dispose of them promptly to maintain a healthy environment.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.accessibility, color: Colors.green),
                  title: Text(
                    '7. Monitor insect growth and lifecycle.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Monitor the insects throughout their lifecycle. For instance, mealworms go through several stages: egg, larvae, pupa, and adult. Regularly assess the size and health of the insects to ensure they are developing properly. If raising them for food, track their growth rate to determine the best harvesting time.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.sick, color: Colors.orange),
                  title: Text(
                    '8. Address common health issues.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Like all animals, insects can become sick. Common issues include fungal growth, parasites, and infections. Keep the environment clean and dry to prevent such issues, and be prepared to treat any problems as soon as they arise. Consider consulting a specialist if you notice widespread health problems among the insects.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.security, color: Colors.blue),
                  title: Text(
                    '9. Secure the insect farm from pests.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Ensure that your insect farm is protected from outside pests like rodents, ants, or other unwanted insects. This can be achieved by sealing gaps and using fine mesh screens to protect the insects while allowing ventilation. Regularly inspect the enclosure to ensure that no pests have invaded the space.',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(
                    '10. Harvest the insects when ready.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Once the insects have reached the desired size or maturity, you can begin harvesting them. Ensure that you handle them carefully to avoid injury or contamination. Depending on the species, you can harvest insects at different stages of life, from larvae to fully grown adults. If harvesting for consumption, ensure they are cooked or processed properly to maintain safety.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Button to navigate to Usage page
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the usage screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UsageScreen(), // UsageScreen is the widget defined in usage.dart
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text('Next: Usage Instructions'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
