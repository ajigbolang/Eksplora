import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

   @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xffFF6F00), // Ganti dengan warna yang diinginkan
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 88),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Eksplora",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "Inter",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none, // Menonaktifkan underline
                ),
              ),
            ],
          ),
          SizedBox(height: 36),
          SvgPicture.asset(
            "assets/icon/intro3.svg",
            width: 250,
            height: 250,
          ),
          SizedBox(height: 25),
          Text(
            "Let’s Explore and",
            style: TextStyle(
              fontSize: 40,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none, // Menonaktifkan underline
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Create the Story!",
            style: TextStyle(
              fontSize: 40,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none, // Menonaktifkan underline
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Waktunya melangkah, mengeksplorasi, dan",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none, // Menonaktifkan underline
            ),
          ),
           Text(
            "menciptakan kisah epik versimu sendiri.",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none, // Menonaktifkan underline
            ),
          ),
        ],
      ),
    );
  }
}