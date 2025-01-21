import 'package:flutter/material.dart';
import 'package:food_land/screen/Order_list/Order_complete/order_complete.dart';

// ignore: camel_case_types
class order_list extends StatefulWidget {
  const order_list({Key? key}) : super(key: key);

  @override
  State<order_list> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<order_list> {
  final List<Product> _products = [
    Product(
      imagePath: 'assets/images/food1.png',
      name: 'Quinoa fruit salad',
      quantity: 2,
      price: 25,
    ),
    Product(
      imagePath: 'assets/images/food2.png',
      name: 'Melon fruit salad',
      quantity: 2,
      price: 23,
    ),
    Product(
      imagePath: 'assets/images/foodm2.png',
      name: 'Tropical fruit salad',
      quantity: 2,
      price: 19,
    ),
  ];

  final List<Color> _backgroundColors = [
    const Color(0xffcbf0d0),
    const Color(0xFFFEF0F0),
    const Color(0xFFF1EFF6),
  ];

  int _calculateTotal() {
    return _products.fold(
        0, (sum, product) => sum + (product.price * product.quantity));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final total = _calculateTotal();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, screenWidth, screenHeight),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _products.length,
                itemBuilder: (context, index) => ProductTile(
                  product: _products[index],
                  backgroundColor:
                      _backgroundColors[index % _backgroundColors.length],
                ), // ProductTile
              ), // ListView.builder
            ), // Expanded
            _buildCheckoutSection(context, screenWidth, total),
          ], // children
        ), // Column
      ), // SafeArea
    ); // Scaffold
  }

  Widget _buildAppBar(
      BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight / 5,
      width: screenWidth,
      color: const Color.fromARGB(255, 255, 165, 81),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildBackButton(context),
          SizedBox(width: screenWidth / 7),
          const Text(
            'My Basket',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ], // children
      ), // Row
    ); // Container
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          ], // children
        ), // Row
      ), // Container
    ); //InkWell
  }

  Widget _buildCheckoutSection(
      BuildContext context, double screenWidth, int total) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total:', style: TextStyle(fontSize: 16)),
              Text('\$ $total',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ], // children
          ), // Row
          const SizedBox(height: 16),
          SizedBox(
            height: 59,
            width: 220,
            child: _buildCheckoutButton(context),
          ), // SizedBox
        ], // children
      ), // Column
    ); // Padding
  }

  ElevatedButton _buildCheckoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) => const PaymentBottomSheet(),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 165, 81),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Center(
        child: Text('Checkout',
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ), // Center
    ); // ElevatedButton
  }
}

class Product {
  final String imagePath;
  final String name;
  final int quantity;
  final int price;

  Product({
    required this.imagePath,
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class ProductTile extends StatelessWidget {
  final Product product;
  final Color backgroundColor;

  const ProductTile(
      {Key? key, required this.product, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  product.imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('${product.quantity} packs'),
                    ], // children
                  ), // Column
                ), // Padding
              ), // Expanded
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text('\$ ${product.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ], // children
          ), // Row
        ), // IntrinsicHeight
      ), // Container
    ); // Padding
  }
}

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({super.key});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  bool showCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: showCardDetails ? _buildCardDetails() : _buildPaymentOptions(),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Delivery Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: '10th avenue, Lekki, Lagos State',
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Number we can call',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: '09090605708',
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 255, 165, 81),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 255, 165, 81),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Pay on delivery'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCardDetails = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 255, 165, 81),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 255, 165, 81),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Pay with card'),
                  ),
                ],
              ),
            ])));
  }

  Widget _buildCardDetails() {
    final formKey = GlobalKey<FormState>();
    String? cardHolderName;
    String? cardNumber;
    String? expiryDate;
    String? cvv;
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Card Holders Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Adolphus Chris',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Card Number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: '1234 5678 9012 1314',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter expiry date';
                          }
                          return null;
                        },
                        onSaved: (value) => expiryDate = value,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'CCV',
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter CVV';
                          }
                          if (value.length != 3) {
                            return 'CVV must be 3 digits';
                          }
                          return null;
                        },
                        onSaved: (value) => cvv = value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const order_complete()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 165, 81),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Complete Order',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ));
  }
}
