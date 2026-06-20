import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _notifications = const [
      {
        'type': 'cart',
        'message':
            'Aenean non accumsan ante. Duis et risus accumsan sem tempus porta ne...',
        'time': '1 hour ago',
      },

      {
        'type': 'cart',
        'message': 'Your cart is waiting for you',
        'time': '3 hour ago',
      },

      {
        'type': 'bookmark',
        'message': 'Your order has been placed successfully',
        'time': '2 hour ago',
      },

      {
        'type': 'cart',
        'message': 'Ready to checkout? Your cart is waiting.',
        'time': '30 mint ago',
      },

      {'type': 'bookmark', 'message': 'Item bookmarked', 'time': '1 hour ago'},
      {
        'type': 'bookmark',
        'message': 'Your order has been placed successfully',
        'time': '2 hour ago',
      },
      {
        'type': 'cart',
        'message': 'You left items in your cart. Complete your order now',
        'time': '4 hour ago',
      },
      {'type': 'bookmark', 'message': 'Item bookmarked', 'time': '1 hour ago'},
      {
        'type': 'cart',
        'message': 'Removed from bookmarks',
        'time': '5 hour ago',
      },
      {
        'type': 'cart',
        'message': 'Open your bookmarks to view saved items',
        'time': '1 hour ago',
      },
      {
        'type': 'bookmark',
        'message': 'Your order has been placed successfully',
        'time': '2 hour ago',
      },
      {
        'type': 'cart',
        'message':
            'Aenean non accumsan ante. Duis et risus accumsan sem tempus porta ne...',
        'time': '1 hour ago',
      },
      {
        'type': 'cart',
        'message': 'Your cart is waiting for you',
        'time': '3 hour ago',
      },
      {
        'type': 'bookmark',
        'message': 'Your order has been placed successfully',
        'time': '2 hour ago',
      },
      {
        'type': 'bookmark',
        'message': 'Your order has been placed successfully',
        'time': '2 hour ago',
      },
      {
        'type': 'cart',
        'message': 'Ready to checkout? Your cart is waiting.',
        'time': '30 mint ago',
      },
      {'type': 'bookmark', 'message': 'Item bookmarked', 'time': '1 hour ago'},
      {
        'type': 'cart',
        'message': 'You left items in your cart. Complete your order now',
        'time': '4 hour ago',
      },
      {'type': 'bookmark', 'message': 'Item bookmarked', 'time': '1 hour ago'},

    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 26, color: Colors.black),
        ),
        title: Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return _notificationTile(
            type: notification['type']!,
            message: notification['message']!,
            time: notification['time']!,
          );
        },
      ),
    );
  }
}

class _notificationTile extends StatelessWidget {
  const _notificationTile({
    required this.type,
    required this.message,
    required this.time,
  });

  final String type;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: type == 'cart'
                  ? Colors.red
                  : const Color(0xff1A237E),
              child: Icon(
                type == 'cart'
                    ? Icons.shopping_bag_outlined
                    : Icons.bookmark_border,
                color: Colors.white,
                size: 22,
              ),
            ),

            title: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),

            subtitle: Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ),
        Divider(height: 1, color: Colors.grey.shade200),
      ],
    );
  }
}
