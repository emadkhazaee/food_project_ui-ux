import 'package:flutter/material.dart';
import 'package:food_land/screen/welcome_authentication/Welcome_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcome_screen(),
    );
  }
}
