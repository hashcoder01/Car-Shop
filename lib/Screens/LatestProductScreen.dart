import 'package:flutter/material.dart';

import 'ProductDetailScreen.dart';

class LatestProductScreen extends StatefulWidget {
  const LatestProductScreen({super.key});

  @override
  State<LatestProductScreen> createState() => _LatestProductScreenState();
}

class _LatestProductScreenState extends State<LatestProductScreen> {
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
      'High quality off-road tires with strong road grip and long durability for rough terrains.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'Premium brake system designed for smooth stopping performance and maximum driving safety.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'size': '35 Inch',
      'description':
      'Heavy-duty tire suitable for all weather conditions and long off-road journeys.',
      'imagePath': 'assets/images/tyre1.png',
    },
    {
      'brand': 'Honda',
      'name': 'Jeep Power Stop',
      'type': 'Brakes',
      'price': 'AED 29',
      'size': 'Medium',
      'description':
      'Reliable brake pads with heat resistance and smooth braking performance.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },

    {
      'brand': 'Audi',
      'name': 'RT Off-Road Jeep',
      'type': 'Accessories & Parts',
      'price': 'AED 41',
      'size': 'Large',
      'description':
      'Strong exterior body accessory designed for stylish and durable off-road protection.',
      'imagePath': 'assets/images/bodyPart.png',
    },
    {
      'brand': 'Audi',
      'name': 'Audi Suspension',
      'type': 'Suspension',
      'price': 'AED 55',
      'size': 'XL',
      'description':
      'Advanced suspension system for comfortable driving and better road stability.',
      'imagePath': 'assets/images/suspension.png',
    },
    {
      'brand': 'Audi',
      'name': 'RT Off-Road Jeep',
      'type': 'Accessories & Parts',
      'price': 'AED 41',
      'size': 'Large',
      'description':
      'Durable body kit made for off-road vehicles with premium finishing quality.',
      'imagePath': 'assets/images/bodyPart.png',
    },
    {
      'brand': 'Audi',
      'name': 'Audi Suspension',
      'type': 'Suspension',
      'price': 'AED 55',
      'size': 'XL',
      'description':
      'Heavy-duty suspension designed for smooth rides on difficult roads.',
      'imagePath': 'assets/images/suspension.png',
    },

    {
      'brand': 'Mercedes',
      'name': 'Jeep Rubicon',
      'type': 'Express Suspension',
      'price': 'AED 34',
      'size': 'Standard',
      'description':
      'Modern suspension kit offering excellent balance and vehicle control.',
      'imagePath': 'assets/images/suspension.png',
    },
    {
      'brand': 'Mercedes',
      'name': 'Mercedes Brakes',
      'type': 'Brakes',
      'price': 'AED 60',
      'size': 'Large',
      'description':
      'High performance brake system with powerful stopping control and durability.',
      'imagePath': 'assets/images/brakeSwitch.png',
    },
    {
      'brand': 'Mercedes',
      'name': 'Jeep Rubicon',
      'type': 'Express Suspension',
      'price': 'AED 34',
      'size': 'Standard',
      'description':
      'Reliable suspension setup suitable for both city and off-road driving.',
      'imagePath': 'assets/images/suspension.png',
    },
    {
      'brand': 'Mercedes',
      'name': 'Mercedes Brakes',
      'type': 'Brakes',
      'price': 'AED 60',
      'size': 'Large',
      'description':
      'Premium quality brake pads with smooth performance and strong grip.',
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
                "Latest Product",
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
              // -- filteredProducts use kiya fix kiya --
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
