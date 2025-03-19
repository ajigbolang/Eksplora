import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerToExplore extends StatelessWidget {
  const BannerToExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: fourthColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            bottom: 0,
            right: 5,
            child: SvgPicture.asset("assets/icon/banner.svg"),
          ),
          Positioned(
            top: 34,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Camping Seru, ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ), // Warna teks utama
                        ),
                      ),
                      TextSpan(
                        text: "Harga ramah!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFC599),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Tenda mulai dari ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      "35K",
                      style: TextStyle(
                        fontSize: 30, // Ukuran lebih besar
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFC599),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "yuk sewa sekarang!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
