import 'package:car/Screens/PageViewScreen.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 250,
                height: 250,
              ),
            ),

            SizedBox(height: 10),
            Card(
              elevation: 4,
              shadowColor: Colors.black12,
              margin: EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("assets/images/Icon.png",width: 50,height: 50,),
                    SizedBox(height: 10),
                    Text(
                      "Choose Your Preferred Language",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please select your language",
                      style: TextStyle(fontSize: 14,),
                    ),
                    SizedBox(height: 20,),

                    Divider(height: 2, color: Color(0xFFEEEEEE)),


                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => PageviewScreen()),
                          );
                        },
                        leading: Image.asset(
                          "assets/images/english_flag.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        title: Text(
                          "English",
                          style: TextStyle(color: Colors.black87,fontSize: 16),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    Divider(height: 2, color: Color(0xFFEEEEEE)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => PageviewScreen()),
                          );
                        },
                        leading: Image.asset(
                          "assets/images/french_flag.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        title: Text(
                          "عربي",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
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
