import 'package:car/Screens/AddCardScreen.dart';
import 'package:car/Screens/OrderComplete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'AddressScreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _paymentsCard = [
    {
      'name': 'HASh',
      'type': 'Visa',
      'number': '**** **** **** 1234',
      'image': 'assets/images/VisaCard.png',
    },
    {
      'name': 'Hanry',
      'type': 'MasterCard',
      'number': '**** **** **** 5678',
      'image': 'assets/images/MasterCard.png',
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
          "Payment",
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
              itemCount: _paymentsCard.length,
              itemBuilder: (context, index) {
                final payments = _paymentsCard[index];
                return _PaymentCardTile(
                  name: payments['name']!,
                  cardNumber: payments['number']!,
                  type: payments['type']!,
                  image: payments['image']!,
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
                  MaterialPageRoute(builder: (_) => AddCardScreen()),
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
                        "Add New Card",
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
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dicount",
                      style: TextStyle(fontSize: 16, color: Color(0xff1A237E)),
                    ),
                    Text(
                      'AED 30',
                      style: TextStyle(color: Color(0xffD32F2F), fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(height: 2, color: Colors.grey.shade100),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(fontSize: 16, color: Color(0xff1A237E)),
                    ),
                    Text(
                      'AED 230',
                      style: TextStyle(fontSize: 16, color: Color(0xffD32F2F)),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(height: 2, color: Colors.grey.shade300),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 16, color: Color(0xff1A237E)),
                    ),
                    Text(
                      'AED 200',
                      style: TextStyle(color: Color(0xffD32F2F), fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 5),
              ],
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
                    MaterialPageRoute(builder: (_) => OrderComplete()),
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

class _PaymentCardTile extends StatelessWidget {
  final String name;
  final String cardNumber;
  final String type;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentCardTile({
    super.key,
    required this.name,
    required this.cardNumber,
    required this.type,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 16),

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
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              cardNumber,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),

            Text(
              type,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: 40),
            SizedBox(width: 10),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
