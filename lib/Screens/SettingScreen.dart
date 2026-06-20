import 'package:car/Screens/AddressScreen.dart';
import 'package:car/Screens/LanguageScreen.dart';
import 'package:car/Screens/PasswordChangeScreen.dart';
import 'package:car/Screens/PrivacyPolicyScreen.dart';
import 'package:car/Screens/SigninScreen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leadingWidth: 80,
        toolbarHeight: 80,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black87),
        ),

        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff1A237E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 40),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PasswordChangeScreen()),
              );
            },
            child: _settingTile("Change Password"),
          ),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LanguageScreen()),
              );
            },
            child: _settingTile("Language"),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddressScreen()),
              );
            },
            child: _settingTile("Addresses"),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()),
              );
            },
            child: _settingTile("Privacy Policy"),
          ),

          /// NOTIFICATION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),

                Switch(
                  value: isOn,

                  activeThumbColor: const Color(0xffD32F2F),

                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              ],
            ),
          ),

          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 60),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Signinscreen()),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.power_settings_new,
                    size: 24,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
          ),

          Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey.shade700),
        ],
      ),
    );
  }
}
