// ignore: file_names
import 'package:flutter/material.dart';
import 'package:food_land/screen/welcome_authentication/Authentication.dart';

// ignore: camel_case_types
class welcome_screen extends StatelessWidget {
  const welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Container(
            height: height / 1.6,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 165, 81)),
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
                  const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                const Wrap(
                  children: [
                    Text(
                      'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                      style: TextStyle(
                          color: Color(0xFF5D577E),
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const authentication()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50),
                      backgroundColor: const Color.fromARGB(255, 255, 165, 81),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
