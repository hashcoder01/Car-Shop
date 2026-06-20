import 'dart:async';

import 'package:car/Screens/CardSearchScreen.dart';
import 'package:car/Screens/CartScreen.dart';
import 'package:car/Screens/FeatureProductScreen.dart';
import 'package:car/Screens/LatestProductScreen.dart';
import 'package:car/Screens/NotificationScreen.dart';
import 'package:car/Screens/SearchScreen.dart';
import 'package:car/Widgets/CustomDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ExtraCart.dart';
import 'ProductDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController(
    viewportFraction: 0.75,
  );
  double _currentPage = 0;
  int _bannerIndex = 0;
  late Timer _timer;

  final List<Map<String, dynamic>> _banners = [
    {'title': 'Search for', 'subtitle': '4X4 Parts', 'color': Colors.orange},
    {'title': 'Search for', 'subtitle': 'Engine Parts', 'color': Colors.blue},
    {'title': 'Search for', 'subtitle': 'Body Parts', 'color': Colors.green},
    {
      'title': 'Search for',
      'subtitle': 'Interior Parts',
      'color': Colors.pinkAccent,
    },
  ];

  @override
  void initState() {
    super.initState();
    _bannerController.addListener(() {
      setState(() {
        _currentPage = _bannerController.page!;
      });
    });
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _bannerIndex = (_bannerIndex + 1) % _banners.length;

      _bannerController.animateToPage(
        _bannerIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black87,
                        size: 28,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NotificationScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.notifications_outlined,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CartScreen()),
                          );
                        },
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 18, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Search name or chassis number",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    //  BANNER
                    SizedBox(
                      height: 230,
                      child: PageView.builder(
                        controller: _bannerController,
                        itemCount: _banners.length,
                        onPageChanged: (index) {
                          setState(() {
                            _bannerIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          double scale = 1;
                          if (_bannerController.position.haveDimensions) {
                            scale = (1 - ((_currentPage - index).abs() * 0.2))
                                .clamp(0.8, 1.0);
                          }

                          return Transform.scale(
                            scale: scale,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CardSearchScreen(),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            _banners[index]['color'],
                                            _banners[index]['color']
                                                .withOpacity(0.7),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _banners[index]['title'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            _banners[index]['subtitle'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _banners.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _bannerIndex == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _bannerIndex == index
                                ? Colors.black
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Featured Products",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FeatureProductScreen(),
                                ),
                              );
                            },
                            child: const Text("View All"),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            productCard(
                              "assets/images/enginePart.png",
                              "Engine Part",
                              "AED 33",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Engine Part',
                                    price: 'AED 33',
                                    imagePath: 'assets/images/enginePart.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: 'Standard',
                                  ),
                                ),
                              ),
                            ),


                            productCard(
                              "assets/images/bodyPart.png",
                              "Body Part",
                              "AED 45",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Body Part',
                                    price: 'AED 45',
                                    imagePath: 'assets/images/bodyPart.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: 'Universal',
                                  ),
                                ),
                              ),
                            ),


                            productCard(
                              "assets/images/enginePart.png",
                              "Engine Part",
                              "AED 33",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Engine Part',
                                    price: 'AED 33',
                                    imagePath: 'assets/images/enginePart.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: 'Standard',
                                  ),
                                ),
                              ),
                            ),

                            productCard(
                              "assets/images/bodyPart.png",
                              "Body Part",
                              "AED 45",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Body Part',
                                    price: 'AED 45',
                                    imagePath: 'assets/images/bodyPart.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: 'Universal',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Latest Products",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LatestProductScreen(),
                                ),
                              );
                            },
                            child: const Text("View All"),
                          ),
                       
                       
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            productCard(
                              "assets/images/headLight.png",
                              "Tire",
                              "AED 50",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Tire',
                                    price: 'AED 50',
                                    imagePath: 'assets/images/headLight.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: '315/70R17',
                                  ),
                                ),
                              ),
                            ),


                            productCard(
                              "assets/images/brakeSwitch.png",
                              "Accessories",
                              "AED 70",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Accessories',
                                    price: 'AED 70',
                                    imagePath: 'assets/images/brakeSwitch.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: 'Universal',
                                  ),
                                ),
                              ),
                            ),


                            productCard(
                              "assets/images/headLight.png",
                              "Tire",
                              "AED 50",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Tire',
                                    price: 'AED 50',
                                    imagePath: 'assets/images/headLight.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: '315/70R17',
                                  ),
                                ),
                              ),
                            ),


                            productCard(
                              "assets/images/brakeSwitch.png",
                              "Accessories",
                              "AED 70",
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProductDetailScreen(
                                    name: 'Accessories',
                                    price: 'AED 70',
                                    imagePath: 'assets/images/brakeSwitch.png',
                                    description: 'Etiam convallis elementum sapien, a aliquam turpis aliquam vitae. Praesent sollicitudin felis vel mi facilisis posuere.',
                                    size: 'Universal',
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget productCard(
  String image,
  String name,
  String price,
  VoidCallback ontap,
) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: 145,
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),

          const SizedBox(height: 8),

          // 🔹 PRICE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}
