import 'package:car/Screens/HomeScreen.dart';
import 'package:car/Widgets/CustomElevatedButton.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RegisterBusiness extends StatelessWidget {
  const RegisterBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,

          toolbarHeight: 90,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: 28, color: Colors.black87),
          ),
          title: Text(
            "Register Business",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),

                _TextField(HintText: "Busniess Name"),

                SizedBox(height: 20),
                _TextField(HintText: "E-mail"),

                SizedBox(height: 20),
                _TextField(HintText: "Location"),

                SizedBox(height: 20),
                _TextField(HintText: "Phone Number"),

                SizedBox(height: 20),
                _TextField(HintText: "License Number"),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DottedBorder(
                    color: Color(0xff1A237E),
                    strokeWidth: 1.5,
                    dashPattern: [6, 4],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(30),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 30,
                            color: Color(0xffD32F2F),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Upload Your Licence",
                            style: TextStyle(color: Color(0xff1A237E)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50,),

                CustomElevatedButton(
                  text: "Sign up",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                SizedBox(height: 15,),

                Center(
                  child: Text(
                    "Terms and Conditions ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1A237E),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final HintText;

  const _TextField({super.key, this.HintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: HintText,
          hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
      ),
    );
  }
}
