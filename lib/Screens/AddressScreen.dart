import 'package:car/Screens/AddAddressScreen.dart';
import 'package:car/Screens/PaymentScreen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _addresses = [
    {
      'name': 'Michelangelo Flores',
      'phone': '0989975432',
      'address': '65B Yost Island Apt, Seattle, US',
    },
    {
      'name': 'Bridget Murphy',
      'phone': '09297575442',
      'address': '65B Yost Island Apt, Seattle, US',
    },
    {
      'name': 'Hash ',
      'phone': '09232737373',
      'address': 'Bahawalpur Uni chowk',
    },
    {
      'name': 'Michelangelo Flores',
      'phone': '0989975432',
      'address': '65B Yost Island Apt, Seattle, US',
    },
    {
      'name': 'Hash ',
      'phone': '09232737373',
      'address': 'Bahawalpur Uni chowk',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 80,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 28, color: Colors.black87),
        ),
        title: Text(
          "Address",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final address = _addresses[index];
                return _AddressTile(
                  name: address['name']!,
                  phone: address['phone']!,
                  address: address['address']!,
                  isSelected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddAddressScreen()),
                );
              },
              child: DottedBorder(
                color: Colors.grey.shade400,
                strokeWidth: 1.5,
                dashPattern: [8, 4],
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.black87, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Add Address",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1A237E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Continue To Payment",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class _AddressTile extends StatelessWidget {
  final String name;

  final String phone;
  final String address;
  final bool isSelected;
  final VoidCallback onTap;

  const _AddressTile({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: InkWell(
          onTap: onTap,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? const Color(0xff1A237E) : Colors.grey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xff1A237E),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(phone, style: TextStyle(fontSize: 14, color: Colors.black54)),
            Text(
              address,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
        trailing: const Icon(Icons.more_vert, color: Colors.grey, size: 20),
      ),
    );
  }
}
