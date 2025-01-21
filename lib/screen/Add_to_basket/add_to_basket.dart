import 'package:flutter/material.dart';

// ignore: camel_case_types
class add_to_basket extends StatefulWidget {
  const add_to_basket({super.key});

  @override
  State<add_to_basket> createState() => _AddToBasketState();
}

class _AddToBasketState extends State<add_to_basket> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 165, 81),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
                      SizedBox(width: 8),
                      Text('Go back', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/foodadd.png',
                height: 176,
                width: 176,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quinoa Fruit Salad',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            child: Image.asset(
                              'assets/images/negative.png',
                              height: 32,
                              width: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Image.asset(
                              'assets/images/add.png',
                              height: 32,
                              width: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '\$ 25.4',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(
                        color: Color.fromARGB(255, 255, 165, 81),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'One pack Contains:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        color: Color(0xFFF3F3F3),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/heart.png'),
                          Container(
                            height: 59,
                            width: 220,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 165, 81),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                'Add to basket',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
