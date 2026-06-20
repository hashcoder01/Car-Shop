import 'package:flutter/material.dart';

class ExtraCartScreen extends StatefulWidget {
  const ExtraCartScreen({super.key});

  @override
  State<ExtraCartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<ExtraCartScreen> {
  // ── CART DATA ──────────────────────────────────
  final List<Map<String, dynamic>> _cartItems = [
    {
      'image': 'assets/images/tyre1.png',
      'name': 'BF Goodrich',
      'size': '315/70R17',
      'price': 41,
      'quantity': 3,
    },
    {
      'image': 'assets/images/tyre1.png',
      'name': 'BF Goodrich',
      'size': '315/70R17',
      'price': 41,
      'quantity': 1,
    },
  ];

  // ── COUPON CONTROLLER ──────────────────────────────────
  final TextEditingController _couponController = TextEditingController();

  // ── DISCOUNT ──────────────────────────────────
  int _discount = 26;

  // ── SUBTOTAL ──────────────────────────────────
  int get _subtotal {
    int total = 0;
    for (var item in _cartItems) {
      total += (item['price'] as int) * (item['quantity'] as int);
    }
    return total - _discount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ── APPBAR ──────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // ── 1. PRODUCTS HEADER ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PRODUCTS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${_cartItems.length} ITEM',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          // ── 2. CART LIST ──────────────────────────────────
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
                      if (_cartItems[index]['quantity'] > 1) {
                        _cartItems[index]['quantity']--;
                      }
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

          // ── 3. COUPON ROW ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                // -- Coupon field --
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _couponController,
                      decoration: const InputDecoration(
                        hintText: 'Coupon Number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // -- Apply button --
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1A237E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── 4. DISCOUNT ROW ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discount',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                Text(
                  'AED $_discount',
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                ),
              ],
            ),
          ),

          // ── 5. SUBTOTAL ROW ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                Text(
                  'AED $_subtotal',
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ── 6. CHECKOUT BUTTON ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1A237E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── CART ITEM TILE ──────────────────────────────────
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              // -- Tyre Image --
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),

              const SizedBox(width: 12),

              // -- Name + Price + Delete --
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -- Name --
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    // -- Size --
                    Text(
                      size,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    const SizedBox(height: 4),

                    // -- Price --
                    Text(
                      'AED $price',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // -- Delete --
                    InkWell(
                      onTap: onDelete,
                      child: const Text(
                        'Delete',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),

              // -- Quantity --
              Column(
                children: [
                  // -- Plus --
                  InkWell(
                    onTap: onIncrement,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, size: 16),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // -- Quantity Number --
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // -- Minus --
                  InkWell(
                    onTap: onDecrement,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.remove, size: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Divider(height: 1, color: Colors.grey.shade200),
      ],
    );
  }
}
