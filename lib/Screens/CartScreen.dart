import 'package:car/Screens/AddressScreen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'image': 'assets/images/tyre1.png',
      'name': 'Goodrich',
      'size': '315/70 R17',
      'price': 41,
      'quantity': 3,
    },

    {
      'image': 'assets/images/tyre1.png',
      'name': 'Goodrich',
      'size': '315/70 R17',
      'price': 41,
      'quantity': 3,
    },

    {
      'image': 'assets/images/tyre1.png',
      'name': 'Goodrich',
      'size': '315/70 R17',
      'price': 41,
      'quantity': 3,
    },

    {
      'image': 'assets/images/tyre1.png',
      'name': 'Goodrich',
      'size': '315/70 R17',
      'price': 41,
      'quantity': 3,
    },

    {
      'image': 'assets/images/tyre1.png',
      'name': 'Goodrich',
      'size': '315/70 R17',
      'price': 41,
      'quantity': 3,
    },

    {
      'image': 'assets/images/tyre1.png',
      'name': 'Goodrich',
      'size': '315/70 R17',
      'price': 41,
      'quantity': 3,
    },
  ];

  final TextEditingController _couponController = TextEditingController();
  int _discount = 26;

  // -- Subtotal --
  int get _subtotal {
    int total = 0;
    for (var item in _cartItems) {
      total += (item['price'] as int) * (item['quantity'] as int);
    }
    return total - _discount;
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black87),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "PRODUCTS",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '${_cartItems.length} ITEM',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return _CartItemTile(
                  imagePath: item['image'],
                  name: item['name'],
                  size: item['size'],
                  price: item['price'],
                  quantity: item['quantity'],
                  onIncrement: () {
                    setState(() {
                      _cartItems[index]['quantity']++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      _cartItems[index]['quantity']--;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      _cartItems.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: TextField(
                      controller: _couponController,
                      decoration: InputDecoration(
                        hintText: "Coupon Code",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1A237E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),

                  child: Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dicount",
                  style: TextStyle(fontSize: 16, color: Color(0xff1A237E)),
                ),
                Text(
                  'AED $_discount',
                  style: TextStyle(color: Color(0xffD32F2F), fontSize: 16),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
                  style: TextStyle(fontSize: 16, color: Color(0xff1A237E)),
                ),
                Text(
                  'AED $_subtotal',
                  style: TextStyle(fontSize: 16, color: Color(0xffD32F2F)),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            child: SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddressScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1A237E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Checkout",
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

class _CartItemTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String size;
  final int price;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const _CartItemTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.size,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 140,
              height: 140,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A237E),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    size,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A237E),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'AED'
                    '$price',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD32F2F),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Delete",
                    style: TextStyle(fontSize: 14, color: Color(0xff1A237E)),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                InkWell(
                  onTap: onIncrement,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, size: 16),
                  ),
                ),
                SizedBox(height: 6),

                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 6),
                InkWell(
                  onTap: onDecrement,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.remove, size: 16),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
