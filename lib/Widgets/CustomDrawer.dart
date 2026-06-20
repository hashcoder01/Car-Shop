import 'package:car/Screens/CartScreen.dart';
import 'package:car/Screens/MyOrderScreen.dart';
import 'package:car/Screens/ProfileScreen.dart';
import 'package:car/Screens/RegisterBusiness.dart';
import 'package:car/Screens/SettingScreen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 100),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/images/logo.png",
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 30),
          _DrawerItem(
            icon: Icons.grid_view_outlined,
            title: "Register Business",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterBusiness()),
              );
            },
          ),
          _DrawerItem(
            icon: Icons.home_outlined,
            title: "Home",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _DrawerItem(
            icon: Icons.person,
            title: "Profile",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
            },
          ),
          _DrawerItem(
            icon: Icons.shopping_bag_outlined,
            title: "My Cart",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),

          _DrawerItem(
            icon: Icons.list_alt_outlined,
            title: "My Orders",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MyOrderScreen()),
              );
            },
          ),
          _DrawerItem(
            icon: Icons.settings_outlined,
            title: "Setting",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingScreen()),
              );
            },
          ),

          Spacer(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              "Sign In",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A237E),
              ),
            ),
            subtitle: Text(
              "Profile",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(fontSize: 15, color: Colors.black87)),
      onTap: onTap,
    );
  }
}
