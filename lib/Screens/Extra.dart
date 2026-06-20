import 'dart:async';
import 'package:car/Widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';

class TestHomeScreen extends StatefulWidget {
  const TestHomeScreen({super.key});

  @override
  State<TestHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TestHomeScreen> {
  final PageController _bannerController = PageController(
    viewportFraction: 0.75,
  );

  double _currentPage = 0;
  int _bannerIndex = 0;
  late Timer _timer;

  // 🔥 UPDATED: 4 cards + colors
  final List<Map<String, dynamic>> _banners = [
    {'title': 'Search for', 'subtitle': '4X4 Parts', 'color': Colors.orange},
    {'title': 'Search for', 'subtitle': 'Engine Parts', 'color': Colors.blue},
    {'title': 'Search for', 'subtitle': 'Body Parts', 'color': Colors.green},
    {
      'title': 'Search for',
      'subtitle': 'Interior Parts',
      'color': Colors.purple,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 🔹 HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: const Icon(Icons.menu),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.notifications_outlined),
                        SizedBox(width: 12),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 SEARCH BAR
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search name or chassis number",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 SLIDER
              // SizedBox(
              //   height: 240,
              //   child: PageView.builder(
              //     controller: _bannerController,
              //     itemCount: _banners.length,
              //     onPageChanged: (index) {
              //       setState(() {
              //         _bannerIndex = index;
              //       });
              //     },
              //     itemBuilder: (context, index) {
              //
              //       double scale = 1;
              //       if (_bannerController.position.haveDimensions) {
              //         scale = (1 - ((_currentPage - index).abs() * 0.2))
              //             .clamp(0.8, 1.0);
              //       }
              //
              //       return Transform.scale(
              //         scale: scale,
              //         child: Container(
              //           margin: const EdgeInsets.symmetric(
              //               horizontal: 10, vertical: 10),
              //           decoration: BoxDecoration(
              //             // 🔥 dynamic color
              //             gradient: LinearGradient(
              //               colors: [
              //                 _banners[index]['color'],
              //                 _banners[index]['color']
              //                     .withOpacity(0.7),
              //               ],
              //             ),
              //             borderRadius: BorderRadius.circular(20),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.black.withOpacity(0.1),
              //                 blurRadius: 8,
              //               )
              //             ],
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 _banners[index]['title'],
              //                 style: const TextStyle(color: Colors.white),
              //               ),
              //               Text(
              //                 _banners[index]['subtitle'],
              //                 style: const TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 26,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               const SizedBox(height: 10),
              //               ElevatedButton(
              //                 onPressed: () {},
              //                 style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.white,
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius:
              //                     BorderRadius.circular(20),
              //                   ),
              //                 ),
              //                 child: const Text(
              //                   "Search",
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: 240,
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
                      scale = (1 - ((_currentPage - index).abs() * 0.2)).clamp(
                        0.8,
                        1.0,
                      );
                    }

                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Stack(
                          children: [
                            // 🔹 BACKGROUND
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    _banners[index]['color'],
                                    _banners[index]['color'].withOpacity(0.7),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            // 🔹 CONTENT
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _banners[index]['title'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    _banners[index]['subtitle'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      "Search",
                                      style: TextStyle(color: Colors.black),

                                      ),
                                  ),
                                ],
                              ),
                            ),

                            // 🔹 SIDE DESIGN
                            Positioned(
                              left: 0,
                              child: Container(
                                width: 10,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),

                            Positioned(
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 DOTS
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
                      color: _bannerIndex == index ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Featured Products",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("View All", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  productCard(
                    "assets/images/engine.png",
                    "Engine Part",
                    "AED 33",
                  ),
                  productCard("assets/images/body.png", "Body Part", "AED 45"),
                ],
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Latest Products",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("View All", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  productCard("assets/images/tire.png", "Tire", "AED 50"),
                  productCard(
                    "assets/images/accessories.png",
                    "Accessories",
                    "AED 70",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget productCard(String image, String name, String price) {
  return Container(
    width: 160,
    margin: const EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 IMAGE
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.asset(
            image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 8),

        // 🔹 PRODUCT NAME
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),

        const SizedBox(height: 4),

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
  );
}
