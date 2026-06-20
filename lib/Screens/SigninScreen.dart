import 'package:car/Screens/Extra.dart';
import 'package:car/Screens/ExtraAddressScreen.dart';
import 'package:car/Screens/ExtraMyOrder.dart';
import 'package:car/Screens/ForgetPasswordScreen.dart';
import 'package:car/Screens/HomeScreen.dart';
import 'package:car/Screens/SignupScreen.dart';
import 'package:car/Widgets/CustomElevatedButton.dart';
import 'package:car/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  // -- Build ke bahar --
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),

              Image.asset("assets/images/logo.png", width: 200, height: 200),

              const SizedBox(height: 60),

              CustomTextField(hintText: "E-mail", prefixIcon: Icons.email),

              const SizedBox(height: 15),

              CustomTextField(
                hintText: "Password",
                prefixIcon: Icons.lock,
                obscureText: !_isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomElevatedButton(
                  text: "Sign In",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ForgetPasswordScreen()),
                  );
                },
                child: const Text(
                  "Forget your Password",
                  style: TextStyle(color: Color(0xff1A237E), fontSize: 15),
                ),
              ),

              const SizedBox(height: 60),

              Text(
                "Don't have an account?",
                style: TextStyle(color: Color(0xff1A237E), fontSize: 15),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.red, size: 14),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A237E),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff1A237E),
                      size: 16,
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
