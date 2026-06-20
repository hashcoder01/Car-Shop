import 'package:car/Screens/SigninScreen.dart';
import 'package:car/Screens/WalkthroghScreen.dart';
import 'package:flutter/material.dart';

class PageviewScreen extends StatefulWidget {
  const PageviewScreen({super.key});

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {
  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [
                Walkthroghscreen(),
                Walkthroghscreen(),
                Walkthroghscreen(),
                Walkthroghscreen(),
                Walkthroghscreen(),
              ],
            ),

            Positioned(
              left: 75,
              right: 0,
              bottom: 20,
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${index + 1}',
                            style: const TextStyle(
                              color: Color(0xff1A237E),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '/5',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [


                        if (index != 0)
                          InkWell(
                            onTap: () {
                              controller.animateToPage(
                                index - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Icon(
                              Icons.arrow_circle_left_outlined,
                              size: 30,
                              color: Color(0xff5e7fb1),
                            ),
                          ),

                        const SizedBox(width: 10),

                        // -- Forward arrow --
                        if (index < 4)
                          InkWell(
                            onTap: () {
                              controller.animateToPage(
                                index + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 30,
                              color: Color(0xff5e7fb1),
                            ),
                          ),


                        if (index == 4)
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Signinscreen(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.check_circle_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),

                        const SizedBox(width: 30),

                      ],
                    ),
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
