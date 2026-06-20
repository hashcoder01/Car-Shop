import 'package:flutter/material.dart';
import '../Widgets/CustomElevatedButton.dart';
import 'PaymentScreen.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        elevation: 0,
        leadingWidth: 80,
        centerTitle: true,
        toolbarHeight: 80,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
        ),

        title: const Text(
          "Add Card",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    /// CARD TYPES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/VisaCard.png", width: 52),

                        Image.asset("assets/images/MasterCard.png", width: 52),

                        Image.asset(
                          "assets/images/AmericanCard.png",
                          width: 52,
                        ),

                        Image.asset(
                          "assets/images/DiscoverCard.png",
                          width: 52,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Center(
                      child: SizedBox(
                        height: 45,

                        child: ElevatedButton(
                          onPressed: () {},

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffD32F2F),
                            elevation: 0,

                            padding: const EdgeInsets.symmetric(horizontal: 28),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),

                          child: const Text(
                            "Scan Credit Card",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _label("Name on card"),
                          const SizedBox(height: 10),

                          const EditTextField(hintText: "Richard Gomez"),

                          const SizedBox(height: 20),

                          _label("Card number"),
                          const SizedBox(height: 10),

                          EditTextField(
                            hintText: "4222 4222 4222 4222",
                            keyboardType: TextInputType.number,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Image.asset(
                                "assets/images/VisaCard.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _label("Expiry date"),

                                    const SizedBox(height: 10),

                                    const EditTextField(hintText: "10 / 22"),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _label("Security code"),

                                    const SizedBox(height: 10),

                                    const EditTextField(
                                      hintText: "447",
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),


                          _label("ZIP/Postal code"),
                          const SizedBox(height: 10),

                          const EditTextField(
                            hintText: "99917",
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 20),


                          _label("Nick Name"),
                          const SizedBox(height: 10),

                          const EditTextField(
                            hintText: "choose nick name for the card",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),

            /// BUTTON
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 35),

              child: CustomElevatedButton(text: "Add Card", onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PaymentScreen()));
              }),
            ),
          ],
        ),
      ),
    );
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
}

/// CUSTOM TEXT FIELD
class EditTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const EditTextField({
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
