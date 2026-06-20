import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Walkthroghscreen extends StatelessWidget {
  const Walkthroghscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "In consequat, quam id sodales hendrerit, eros mi molestie leo, nec lacinia risus neque tristique augue.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Stack(
              children: [
                Image.asset("assets/images/iphonelogo.png"),
                Positioned(
                  top: 125,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Image.asset(
                      "assets/images/minicarlogo.png",
                      width: 80,
                    ),
                  ),
                ),

                Positioned(
                  top: 190,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Text(
                        "Adventures",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "4X4 PARTS",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
