import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eksplora/screen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Onboarding()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF6F00), // Sesuaikan dengan warna tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min, // Agar sesuai dengan ukuran kontennya
              children: [
                SvgPicture.asset(
                  'assets/icon/logo.svg', // Path ke file SVG
                  width: 120, // Sesuaikan ukuran ikon
                  height: 120,
                ),
                const SizedBox(width: 10), // Jarak antara ikon dan teks
                const Text(
                  'Eksplora',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
