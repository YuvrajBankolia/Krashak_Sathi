import 'package:flutter/material.dart';

class LatestDataPage extends StatelessWidget {
  final Map soilSamples; // Data passed from the previous page

  const LatestDataPage({super.key, required this.soilSamples});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Data'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Container for Phosphorus text
              Container(
                height: 90,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phosphorus: ${soilSamples['Phosphorus']?.toString() ?? 'No Data'}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Add more fields if needed
                  ],
                ),
              ),
              // RichText placed outside the container
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                        'Phosphorus is a vital macronutrient required for plant growth and plays a key role in energy transfer through ATP, root development, and overall plant health. It is essential for processes like photosynthesis, nutrient transport, and the formation of flowers, fruits, and seeds. Plants with sufficient phosphorus grow stronger and develop more robust root systems, leading to higher yields and better resistance to environmental stresses.',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                    children: <TextSpan>[
                      TextSpan(
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                        'Phosphorus is a vital macronutrient required for plant growth and plays a key role in energy transfer through ATP, root development, and overall plant health. It is essential for processes like photosynthesis, nutrient transport, and the formation of flowers, fruits, and seeds. Plants with sufficient phosphorus grow stronger and develop more robust root systems, leading to higher yields and better resistance to environmental stresses.Sustainable phosphorus management is crucial in agriculture to maintain healthy crop production and prevent issues like eutrophication caused by excess phosphorus runoff.',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                    children: <TextSpan>[
                      TextSpan(
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
