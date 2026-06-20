import 'package:flutter/material.dart';


class ExtraMyOrdersScreen extends StatefulWidget {
  const ExtraMyOrdersScreen({super.key});

  @override
  State<ExtraMyOrdersScreen> createState() => _ExtraMyOrdersScreenState();
}

class _ExtraMyOrdersScreenState extends State<ExtraMyOrdersScreen> {

  int _selectedTab = 0;


  final List<Map<String, String>> _activeOrders = [
    {
      'id': '#1244667',
      'name': 'Jeep BF Goodrich',
      'type': 'Body Part',
      'price': 'AED 41',
      'image': 'assets/images/bodyPart.png',
    },

    {
      'id': '#5423652',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 33',
      'image': 'assets/images/tyre1.png',
    },
  ];


  final List<Map<String, String>> _pastOrders = [
    {
      'id': '#1234567',
      'name': 'Jeep BF Goodrich',
      'type': 'Tires',
      'price': 'AED 41',
      'image': 'assets/images/tyre1.png',
    },
    {
      'id': '#1244667',
      'name': 'Jeep BF Goodrich',
      'type': 'Body Part',
      'price': 'AED 41',
      'image': 'assets/images/bodyPart.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
        ),
        title: const Text(
          'My Orders',
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

          Row(
            children: [

              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 12),

                      Text(
                        'Active Orders',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: _selectedTab == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _selectedTab == 0 ? Colors.black : Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),


                      Container(
                        height: 2,
                        color: _selectedTab == 0
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),


              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 12),

                      Text(
                        'Past Orders',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: _selectedTab == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _selectedTab == 1 ? Colors.black : Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // -- Underline --
                      Container(
                        height: 2,
                        color: _selectedTab == 1
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Divider(height: 1, color: Colors.grey.shade200),

          // ── 2. ORDER LIST ──────────────────────────────────
          Expanded(
            child: ListView.builder(
              itemCount: _selectedTab == 0
                  ? _activeOrders.length
                  : _pastOrders.length,
              itemBuilder: (context, index) {
                final order = _selectedTab == 0
                    ? _activeOrders[index]
                    : _pastOrders[index];
                return _OrderTile(
                  id: order['id']!,
                  name: order['name']!,
                  type: order['type']!,
                  price: order['price']!,
                  imagePath: order['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ── ORDER TILE ──────────────────────────────────
class _OrderTile extends StatelessWidget {
  final String id;
  final String name;
  final String type;
  final String price;
  final String imagePath;

  const _OrderTile({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // -- Tyre Image --
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),

              const SizedBox(width: 16),

              // -- Order Info --
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Order ID --
                  Text(
                    id,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 4),

                  // -- Name --
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // -- Type --
                  Text(
                    type,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 4),

                  // -- Price --
                  Text(
                    price,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
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
