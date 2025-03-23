import 'dart:async';
import '../api_call.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment(0.5, 0.5),
      child: Container(
        color: Colors.brown.shade200,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/landscape-8592826.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'Krashak Sathi',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    ));
  }
}
//  decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 "assets/images/landscape-8592826.jpg",
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),