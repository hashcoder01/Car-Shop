import 'package:car/Screens/PasswordChangeScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Hash";
  String about = "Hash Coder 😎";
  String phone = "+92 333 4445566";
  String email = "hash@gmail.com";

  void _editField(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(
      text: currentValue,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Edit $title",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter $title",
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  onSave(controller.text);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildTile({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      subtitle: Text(value),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),

            CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, color: Colors.black, size: 60),
            ),

            const SizedBox(height: 35),

            buildTile(
              icon: Icons.person,
              title: "Name",
              value: name,
              onTap: () {
                _editField("Name", name, (val) => name = val);
              },
            ),
            SizedBox(height: 10),
            buildTile(
              icon: Icons.info,
              title: "About",
              value: about,
              onTap: () {
                _editField("About", about, (val) => about = val);
              },
            ),
            SizedBox(height: 10),
            buildTile(
              icon: Icons.phone,
              title: "Phone",
              value: phone,
              onTap: () {
                _editField("Phone", phone, (val) => phone = val);
              },
            ),

            SizedBox(height: 10),
            buildTile(
              icon: Icons.email,
              title: "Email",
              value: email,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PasswordChangeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
