import 'package:flutter/material.dart';

import 'ProductDetailScreen.dart';

class FeatureProductScreen extends StatefulWidget {
  const FeatureProductScreen({super.key});

  @override
  State<FeatureProductScreen> createState() => _FeatureProductScreenState();
}

class _FeatureProductScreenState extends State<FeatureProductScreen> {
  int _selectedBrand = 0;

  final List<String> _brands = ['Honda', 'Audi', 'Mercedes'];

  final List<Map<String, String>> _products = [
    {
      'brand': 'Honda',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'size': '35 Inch',
      'description':
      'Premium off-road tire designed for rough terrain and long-lasting durability. Provides strong road grip and smooth driving experience.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'High-quality brake system built for safety and performance. Ensures reliable stopping power with reduced noise and vibration.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'size': '35 Inch',
      'description':
      'Heavy-duty all terrain tire with excellent traction and durability. Perfect for both city roads and off-road adventures.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'Reliable braking performance with improved safety and comfort. Designed for powerful and smooth braking response.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'size': '35 Inch',
      'description':
      'Strong and stylish tire suitable for extreme road conditions. Offers better handling and long-lasting performance.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'Premium brake pads engineered for smooth stopping power. Reduces heat and vibration during braking.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'size': '35 Inch',
      'description':
      'Advanced tire technology providing superior grip and comfort. Built for high performance driving experience.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'Durable and efficient brake system suitable for SUVs and off-road vehicles. Provides safe and responsive braking.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'size': '35 Inch',
      'description':
      'Rugged tire made for adventurous journeys and difficult terrains. Delivers stability and control on every drive.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'Modern brake solution offering excellent stopping performance. Designed for durability and daily driving safety.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },

    {
      'brand': 'Audi',
      'name': 'RT Off-Road Jeep',
      'type': 'Accessories & Parts',
      'price': 'AED 41',
      'size': 'Large',
      'description':
      'Stylish body accessory made for off-road vehicles. Enhances protection and gives a premium rugged appearance.',
      'imagePath': 'assets/images/bodyPart.png',
    },
    {
      'brand': 'Audi',
      'name': 'Audi Suspension',
      'type': 'Suspension',
      'price': 'AED 55',
      'size': 'XL',
      'description':
      'High-performance suspension system designed for comfort and stability. Ensures smooth driving on rough roads.',
      'imagePath': 'assets/images/suspension.png',
    },

    {
      'brand': 'Audi',
      'name': 'RT Off-Road Jeep',
      'type': 'Accessories & Parts',
      'price': 'AED 41',
      'size': 'Large',
      'description':
      'Durable exterior accessory with strong material quality. Perfect for enhancing off-road vehicle style.',
      'imagePath': 'assets/images/bodyPart.png',
    },
    {
      'brand': 'Audi',
      'name': 'Audi Suspension',
      'type': 'Suspension',
      'price': 'AED 55',
      'size': 'XL',
      'description':
      'Premium suspension kit built for better handling and ride comfort. Suitable for all terrain conditions.',
      'imagePath': 'assets/images/suspension.png',
    },

    {
      'brand': 'Audi',
      'name': 'RT Off-Road Jeep',
      'type': 'Accessories & Parts',
      'price': 'AED 41',
      'size': 'Large',
      'description':
      'Modern body part accessory with excellent finishing and durability. Adds extra protection to the vehicle.',
      'imagePath': 'assets/images/bodyPart.png',
    },
    {
      'brand': 'Audi',
      'name': 'Audi Suspension',
      'type': 'Suspension',
      'price': 'AED 55',
      'size': 'XL',
      'description':
      'Reliable suspension technology delivering smooth and stable driving performance on every road.',
      'imagePath': 'assets/images/suspension.png',
    },

    {
      'brand': 'Audi',
      'name': 'RT Off-Road Jeep',
      'type': 'Accessories & Parts',
      'price': 'AED 41',
      'size': 'Large',
      'description':
      'High-quality off-road accessory designed for maximum durability and premium vehicle styling.',
      'imagePath': 'assets/images/bodyPart.png',
    },
    {
      'brand': 'Audi',
      'name': 'Audi Suspension',
      'type': 'Suspension',
      'price': 'AED 55',
      'size': 'XL',
      'description':
      'Comfort-focused suspension system offering improved road grip and balanced driving experience.',
      'imagePath': 'assets/images/suspension.png',
    },

    {
      'brand': 'Mercedes',
      'name': 'Jeep Rubicon',
      'type': 'Express Suspension',
      'price': 'AED 34',
      'size': 'Standard',
      'description':
      'Heavy-duty suspension built for adventure and rough terrain driving. Provides stability and smooth handling.',
      'imagePath': 'assets/images/suspension.png',
    },
    {
      'brand': 'Mercedes',
      'name': 'Mercedes Brakes',
      'type': 'Brakes',
      'price': 'AED 60',
      'size': 'Medium',
      'description':
      'Efficient braking system with premium safety features. Ensures quick stopping response and driving confidence.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },

    {
      'brand': 'Mercedes',
      'name': 'Jeep Rubicon',
      'type': 'Express Suspension',
      'price': 'AED 34',
      'size': 'Standard',
      'description':
      'Advanced suspension solution for comfortable and controlled driving performance on all surfaces.',
      'imagePath': 'assets/images/suspension.png',
    },
    {
      'brand': 'Mercedes',
      'name': 'Mercedes Brakes',
      'type': 'Brakes',
      'price': 'AED 60',
      'size': 'Medium',
      'description':
      'High-quality brake system engineered for durability and superior stopping power in all conditions.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },

    {
      'brand': 'Mercedes',
      'name': 'Jeep Rubicon',
      'type': 'Express Suspension',
      'price': 'AED 34',
      'size': 'Standard',
      'description':
      'Professional-grade suspension system delivering better road balance and enhanced driving comfort.',
      'imagePath': 'assets/images/suspension.png',
    },
    {
      'brand': 'Mercedes',
      'name': 'Mercedes Brakes',
      'type': 'Brakes',
      'price': 'AED 60',
      'size': 'Medium',
      'description':
      'Strong and reliable brake performance with reduced vibration and smooth stopping functionality.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
  ];


  List<Map<String, String>> get _filteredProducts {
    return _products
        .where((product) => product['brand'] == _brands[_selectedBrand])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 28, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Featured Product",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/car_banner.png",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: _BrandTabDelegate(
              brands: _brands,
              selectedIndex: _selectedBrand,
              onTap: (index) {
                setState(() {
                  _selectedBrand = index;
                });
              },
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {

              final product = _filteredProducts[index];
              return _ProductTile(
                name: product['name']!,
                type: product['type']!,
                price: product['price']!,
                imagePath: product['imagePath']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(
                        name: product['name']!,
                        price: product['price']!,
                        imagePath: product['imagePath']!,
                        description: product['description']!,
                        size: product['size']!,
                      ),
                    ),
                  );
                },
              );
            }, childCount: _filteredProducts.length),
          ),
        ],
      ),
    );
  }
}

class _BrandTabDelegate extends SliverPersistentHeaderDelegate {
  final List<String> brands;
  final int selectedIndex;
  final Function(int) onTap;

  _BrandTabDelegate({
    required this.brands,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: List.generate(
              brands.length,
              (index) => Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        brands[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 2,
                        color: selectedIndex == index
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ).toList(),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _ProductTile extends StatelessWidget {
  final String name;
  final String type;
  final String price;
  final String imagePath;
  final VoidCallback onTap;

  const _ProductTile({
    required this.name,
    required this.type,
    required this.price,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      type,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(height: 2, color: Colors.grey.shade300),
      ],
    );
  }
}
