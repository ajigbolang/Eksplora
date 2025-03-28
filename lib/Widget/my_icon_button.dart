import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Widget icon; // Ubah dari IconData ke Widget
  final VoidCallback pressed;
  const MyIconButton({super.key, required this.icon, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: const Color(0xffE2E2E2),
        fixedSize: const Size(50, 50),
      ),
      onPressed: pressed,
      icon: icon, // Langsung gunakan Widget icon
    );
  }
}
