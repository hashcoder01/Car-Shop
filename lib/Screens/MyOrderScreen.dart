import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 80,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 28, color: Colors.black87),
        ),

        title: Text(
          "My Order",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff1A237E),
          ),
        ),
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Active Order",
                            style: TextStyle(
                              fontSize: 16,
                              color: _selectedTab == 0
                                  ? Color(0xff1A237E)
                                  : Colors.grey,
                              fontWeight: _selectedTab == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 2,
                            color: _selectedTab == 0
                                ? Color(0xff1A237E)
                                : Colors.transparent,
                          ),
                        ],
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Past Order",
                            style: TextStyle(
                              fontSize: 16,
                              color: _selectedTab == 1
                                  ? Color(0xff1A237E)
                                  : Colors.grey,
                              fontWeight: _selectedTab == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 2,
                            color: _selectedTab == 1
                                ? Color(0xff1A237E)
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),

          Expanded(
            child: ListView.builder(
              itemCount: _selectedTab == 0
                  ? _activeOrders.length
                  : _pastOrders.length,
              itemBuilder: (context, index) {
                final order = _selectedTab == 0
                    ? _activeOrders[index]
                    : _pastOrders[index];
                return _ordersTile(
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

class _ordersTile extends StatelessWidget {
  final String id;
  final String name;
  final String type;
  final String price;
  final String imagePath;

  const _ordersTile({
    super.key,
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id,
                    style: TextStyle(fontSize: 14, color: Color(0xff1A237E)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    type,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 2, color: Colors.grey.shade300),
      ],
    );
  }
}
