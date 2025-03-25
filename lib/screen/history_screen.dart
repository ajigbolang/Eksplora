import 'package:flutter/material.dart';
import 'package:eksplora/constant/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Saya",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            color: fourthColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: fourthColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        //* Pindahkan Column ke dalam body (awalnya "return: Column")
        children: [
          const SizedBox(height: 10),

          //* Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icon/search.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: thirdColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: thirdColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: thirdColor, width: 2),
                ),
                hintText: "Cari di sini...",
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),

          //* Konten Riwayat
          const Expanded(
            child: Center(
              child: Text(
                "Belum ada riwayat.",
                style: TextStyle(fontFamily: "Inter", color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
