import 'package:flutter/material.dart';
import 'package:food_land/screen/home_screen/home_screen.dart';

class authentication extends StatelessWidget {
  const authentication({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 229, 229, 229),
          body: Column(
            children: [
              Container(
                height: height / 1.6,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 165, 81)),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 6,
                      ),
                      Image.asset(
                        'assets/images/basket_Authentication.png',
                        height: 200,
                        width: 240,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/shadow_basket_Authentication.png',
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
                          'What is your firstname?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      // controller: phoneController,
                      // style: normaltext2,
                      // maxLength: 11,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: backGroundlight,
                        // border: OutlineInputBorder(),
                        labelText: 'your name',
                        // labelStyle: normaltext2,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_screen()));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor:
                              Color.fromARGB(255, 255, 165, 81), // رنگ پس‌زمینه
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // گوشه‌های گرد
                          ),
                        ),
                        child: const Text(
                          'Start Ordering',
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
