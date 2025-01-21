import 'package:flutter/material.dart';
import 'package:food_land/data/combo_list.dart';
import 'package:food_land/data/menu_list.dart';
import 'package:food_land/screen/Add_to_basket/add_to_basket.dart';
import 'package:food_land/screen/Order_list/order_list.dart';

// ignore: camel_case_types
class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

// ignore: camel_case_types
class _home_screenState extends State<home_screen> {
  int selectedIndex = 0;
  List<String> names = ['Hottest', 'Popular', 'New combo', 'Top'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 24, left: 24, top: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/drawer.png',
                      height: 30,
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const order_list()));
                      },
                      child: const Icon(
                        Icons.shopping_cart_checkout,
                        color: Color.fromARGB(255, 255, 165, 81),
                        size: 35,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Text(
                      'Hello tony,',
                      style: TextStyle(
                        color: Color(0xFF5D577E),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'What fruit salad',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'combo do you want today?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Search for fruit salad combos',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/setting.png',
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Text(
                      'Recommended Combo',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 235,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: comboData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 235,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color:
                                            Color.fromARGB(255, 255, 165, 81),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Image.asset(comboData[index]["image"]),
                                        const SizedBox(height: 10),
                                        Text(
                                          comboData[index]["name"],
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${comboData[index]["price"]}',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 165, 81),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Image.asset('assets/images/add.png',
                                          height: 30, width: 30),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(names.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: selectedIndex == index ? 24 : 16,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        child: Text(names[index]),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: menu.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const add_to_basket()));
                          },
                          child: Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                              color: boxColors[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color:
                                            Color.fromARGB(255, 255, 165, 81),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          menu[index]["image"],
                                          height: 50,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          menu[index]["name"],
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${menu[index]["price"]}',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 165, 81),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Image.asset('assets/images/add.png',
                                          height: 30, width: 30),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
