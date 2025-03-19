import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:eksplora/screen/home_screen.dart';

class CreateAccountSuccess extends StatefulWidget {
  const CreateAccountSuccess({super.key});

  @override
  State<CreateAccountSuccess> createState() => _CreateAccountSuccessState();
}

class _CreateAccountSuccessState extends State<CreateAccountSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 278,
              width: 278,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/account_success.png'),
                  scale: 2.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selamat Akun telah berhasil dibuat!',
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sekarang Anda bisa memulai mencari dan\ menyewa perlengkapan camping.Yuk, jelajahi sekarang!',
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
                height: 55,
                width: 300,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Selanjutnya',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: primaryColor,
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
