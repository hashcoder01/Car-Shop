import 'package:flutter/material.dart';
import 'package:car/Screens/ProductDetailScreen.dart';

class EcommerceScreen2 extends StatefulWidget {
  const EcommerceScreen2({super.key});

  @override
  State<EcommerceScreen2> createState() => _EcommerceScreen2State();
}

class _EcommerceScreen2State extends State<EcommerceScreen2> {
  final List<Map<String, String>> _categories = [
    {
      'name': 'Engine Parts',
      'image': 'assets/images/enginePart.png',
      'description':
          'High quality engine parts for your vehicle. Etiam convallis elementum sapien, aliquam turpis aliquam vitae.',
      'size': 'Standard',
      'price': 'AED 33',
    },
    {
      'name': 'Lights',
      'image': 'assets/images/lights.png',
      'description':
          'Premium lights for better visibility. Praesent sollicitudin felis vel mi facilisis posuere.',
      'size': 'Universal',
      'price': 'AED 45',
    },
    {
      'name': 'Tires & Wheels',
      'image': 'assets/images/tyre1.png',
      'description':
          'All terrain tires for your jeep. Etiam convallis elementum sapien, aliquam turpis aliquam vitae.',
      'size': '315/70R17',
      'price': 'AED 50',
    },
    {
      'name': 'Brake system',
      'image': 'assets/images/brakeSwitch.png',
      'description':
          'High performance brake system. Praesent sollicitudin felis vel mi facilisis posuere.',
      'size': 'Standard',
      'price': 'AED 60',
    },
    {
      'name': 'Body Parts',
      'image': 'assets/images/bodyPart.png',
      'description':
          'Premium body parts for your vehicle. Etiam convallis elementum sapien, aliquam turpis aliquam vitae.',
      'size': 'Universal',
      'price': 'AED 70',
    },
    {
      'name': 'Suspension',
      'image': 'assets/images/suspension.png',
      'description':
          'Heavy duty suspension system. Praesent sollicitudin felis vel mi facilisis posuere.',
      'size': 'Standard',
      'price': 'AED 80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 28, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/images/jeep1.png",
                        fit: BoxFit.cover,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.6),
                            ],
                          ),
                        ),
                      ),

                      const Positioned(
                        bottom: 16,
                        left: 16,
                        child: Text(
                          '4x4 Catalog',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: _categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return _CategoryCard(
                      name: category['name']!,
                      imagePath: category['image']!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              name: category['name']!,
                              price: category['price']!,
                              imagePath: category['image']!,
                              description: category['description']!,
                              size: category['size']!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.name,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
