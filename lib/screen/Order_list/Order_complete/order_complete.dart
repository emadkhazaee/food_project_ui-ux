import 'package:flutter/material.dart';

class order_complete extends StatelessWidget {
  const order_complete({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/success.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(133, 56),
                backgroundColor: Color.fromARGB(255, 255, 165, 81),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Track order', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Continue shopping'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(181, 50),
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
            ),
          ],
        ),
      )),
    );
  }
}
