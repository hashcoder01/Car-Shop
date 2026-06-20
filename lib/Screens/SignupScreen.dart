import 'package:car/Screens/SigninScreen.dart';
import 'package:car/Screens/WalkthroghScreen.dart';
import 'package:car/Widgets/CustomElevatedButton.dart';
import 'package:car/Widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset("assets/images/logo.png", width: 200, height: 200),

            SizedBox(height: 60),

            CustomTextField(hintText: "Name", prefixIcon: Icons.person),

            SizedBox(height: 15),

            CustomTextField(hintText: "E-Mail", prefixIcon: Icons.mail),

            SizedBox(height: 15),

            CustomTextField(hintText: "Password", prefixIcon: Icons.lock),
            SizedBox(height: 30),

            CustomElevatedButton(
              text: "Sign up",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Signinscreen()),
                );
              },
            ),
            SizedBox(height: 25),
            Text(
              "Terms And Conditions",
              style: TextStyle(color: Color(0xff1A237E)),
            ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account Sign in  ",
                  style: TextStyle(color: Color(0xff1A237E)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Signinscreen()),
                    );
                  },
                  child: Text(
                    "Sign In ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A237E),
                    ),
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
