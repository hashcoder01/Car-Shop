import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> recentSearches = [
      "Audi Q8 engine 2015",
      "Audi suspension 2 locks",
      "Audi brake system 2001",
      "Audi gear kit 2018",
      "Audi steering lock",
      "Audi headlights 2020",
    ];
    final List<String> suggestions = [
      "Excepteur sint occaecat",
      "Cupidatat non",
      "Sunt in culpa qui officia",
      "Cupidatat non",
      "Excepteur sint occaecat",
    ];
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        toolbarHeight: 120,
        leadingWidth: 80,
        backgroundColor: Color(0xffF5F5F5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,size: 28,),
        ),
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search name or chassis number",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Container(
                //   width: double.infinity,
                //   margin: const EdgeInsets.symmetric(horizontal: 20),
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 20,
                //     vertical: 20,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: recentSearches.map((item) {
                //       return Padding(
                //         padding: const EdgeInsets.only(bottom: 18),
                //         child: Align(
                //           alignment: Alignment.centerLeft,
                //           child: Text(
                //             item,
                //             style: const TextStyle(
                //               fontSize: 14,
                //               color: Colors.black87,
                //             ),
                //           ),
                //
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                const SizedBox(height: 15),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: List.generate(recentSearches.length, (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.history,
                                  color: Colors.grey.shade400,
                                  size: 24,
                                ),

                                const SizedBox(width: 18),

                                Expanded(
                                  child: Text(
                                    recentSearches[index],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (index != recentSearches.length - 1)
                            Divider(height: 1, color: Colors.grey.shade200),
                        ],
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 25),

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: Colors.white,
                //   ),
                //   child: Column(
                //     children: suggestions.map((items) {
                //       return Padding(
                //         padding: EdgeInsets.only(bottom: 20),
                //         child: Row(
                //           children: [
                //             const Icon(
                //               Icons.search,
                //               size: 18,
                //               color: Colors.grey,
                //             ),
                //             const SizedBox(height: 10),
                //             Text(
                //               items,
                //               style: TextStyle(fontSize: 13, color: Colors.grey),
                //             ),
                //           ],
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: List.generate(suggestions.length, (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.blue.shade100,
                                  size: 28,
                                ),

                                const SizedBox(width: 20),

                                Expanded(
                                  child: Text(
                                    suggestions[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (index != suggestions.length - 1)
                            Divider(height: 1, color: Colors.grey.shade200),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
