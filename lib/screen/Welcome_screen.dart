import 'package:flutter/material.dart';

class welcome_screen extends StatelessWidget {
  const welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Container(
            height: height / 1.6,
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromARGB(255, 255, 165, 81)),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 6,
                  ),
                  Image.asset(
                    'assets/images/basket_welcome.png',
                    height: 200,
                    width: 240,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/shadow_basket_welcome.png',
                    height: 12,
                    width: 240,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 40),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Get The Freshest Fruit Salad Combo',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: const Wrap(
                    children: [
                      Text(
                        'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                        style: TextStyle(
                            color: Color(0xFF5D577E),
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50),
                      backgroundColor:
                          Color.fromARGB(255, 255, 165, 81), // رنگ پس‌زمینه
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // گوشه‌های گرد
                      ),
                    ),
                    child: const Text(
                      'Let’s Continue',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
