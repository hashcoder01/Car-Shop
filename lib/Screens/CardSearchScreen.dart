import 'package:car/Screens/EcommerceScreen1.dart';
import 'package:flutter/material.dart';

class CardSearchScreen extends StatefulWidget {
  const CardSearchScreen({super.key});

  @override
  State<CardSearchScreen> createState() => _CardSearchScreenState();
}

class _CardSearchScreenState extends State<CardSearchScreen> {
  String? _selectedBrand;
  String? _selectedModel;
  String? _selectedYear;

  final List<String> _brands = [
    'Gladiator',
    'Jeep',
    'Land Rover',
    'Range Rover',
    'Mercedes-Benz',
    'Nissan Frontier',
    'Toyota',
  ];

  final List<String> _models = ['Civic', 'Corolla', 'Camry', 'A4', 'C-Class'];

  final List<String> _years = ['2020', '2021', '2022', '2023', '2024'];

  void _showListSheet({
    required String title,
    required List<String> items,
    required Function(String) onSelect,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A237E),
                ),
              ),

              const SizedBox(height: 16),

              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        onSelect(items[index]);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Center(
                          child: Text(
                            items[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

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
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Find Accessories\nfor your car',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A237E),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 40),

            _buildSelector(
              hint: 'Select Brand',
              value: _selectedBrand,
              onTap: () {
                _showListSheet(
                  title: 'Select brand',
                  items: _brands,
                  onSelect: (value) {
                    setState(() {
                      _selectedBrand = value;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 16),

            _buildSelector(
              hint: 'Select Models',
              value: _selectedModel,
              onTap: () {
                _showListSheet(
                  title: 'Select model',
                  items: _models,
                  onSelect: (value) {
                    setState(() {
                      _selectedModel = value;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 16),

            _buildSelector(
              hint: 'Select Parts Year',
              value: _selectedYear,
              onTap: () {
                _showListSheet(
                  title: 'Select year',
                  items: _years,
                  onSelect: (value) {
                    setState(() {
                      _selectedYear = value;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EcommerceScreen1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1A237E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelector({
    required String hint,
    required String? value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? hint,
              style: TextStyle(
                fontSize: 14,
                color: value != null ? Colors.black87 : Colors.grey,
              ),
            ),

            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
