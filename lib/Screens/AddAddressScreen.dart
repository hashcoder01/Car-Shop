import 'package:car/Screens/AddressScreen.dart';
import 'package:car/Widgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 80,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 28),
        ),
        title: Text(
          "Create Address",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),

                    _label("Name"),
                    SizedBox(height: 10),
                    _ElevatedTextField(hintText: 'Enter your name',keyboardType: TextInputType.text,),
                    SizedBox(height: 15),

                    _label("Phone"),
                    SizedBox(height: 10),
                    _ElevatedTextField(hintText: 'Enter you Phone Number',keyboardType: TextInputType.number,),

                    SizedBox(height: 15),
                    _label("City"),
                    SizedBox(height: 10),
                    _ElevatedTextField(hintText: 'Enter you city name'),

                    SizedBox(height: 15),
                    _label("Address"),
                    SizedBox(height: 10),
                    _ElevatedTextField(hintText: 'Enter you Posrel Address',),

                    SizedBox(height: 15),
                    _label("Zip Code"),
                    SizedBox(height: 10),
                    _ElevatedTextField(hintText: 'Enter your Zip Code',keyboardType: TextInputType.number,),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: CustomElevatedButton(
              text: "Add Address",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddressScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _label(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 16),

    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

// class _ElevatedTextField extends StatelessWidget {
//   final String HintText;
//
//   const _ElevatedTextField({super.key, required this.HintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 40),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade200),
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.01),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: HintText,
//           hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         ),
//       ),
//     );
//   }
// }

class _ElevatedTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const _ElevatedTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: TextField(
        keyboardType: keyboardType,

        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),

        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
