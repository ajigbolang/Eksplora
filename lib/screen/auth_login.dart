import 'package:eksplora/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:eksplora/screen/auth_register.dart';
import 'package:eksplora/screen/onboarding.dart';
import 'package:eksplora/constant/constant.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xffFF6F00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 90, left: 23),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Onboarding()),
                        );
                      },
                      child: HeroIcon(
                        HeroIcons.arrowLeft,
                        size: 25,
                        color: Color(0xffffffff),
                        style: HeroIconStyle.solid,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Onboarding()),
                        );
                      },
                      child: Text(
                        "Kembali",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 105),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 36, left: 23, right: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hai, Sobat Tangguh",
                        style: TextStyle(
                          letterSpacing: -0.5,
                          fontFamily: "Inter",
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff1F5460),
                        ),
                      ),
                      Text(
                        "Silahkan masuk untuk menggunakan aplikasi!",
                        style: TextStyle(
                          letterSpacing: -0.2,
                          fontFamily: "Inter",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(225, 77, 77, 77),
                        ),
                      ),
                      SizedBox(height: 49),
                      TextField(
                        decoration: InputDecoration(
                          filled: false,
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Color.fromARGB(225, 128, 128, 128),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/profile.svg',
                              width: 20,
                              height: 20,
                              color: Color(
                                0xfff1F5460,
                              ), // Sesuaikan warna jika perlu
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: fourthColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffFF6F00),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(
                          filled: false,
                          labelText: "Kata Sandi",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Color.fromARGB(225, 128, 128, 128),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/lock.svg',
                              width: 20,
                              height: 20,
                              color: Color(
                                0xfff1F5460,
                              ), // Sesuaikan warna jika perlu
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: fourthColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffFF6F00),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/eye.svg',
                              width: 20,
                              height: 20,
                              color: Color(
                                0xfff1F5460,
                              ), // Sesuaikan warna jika perlu
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffff6f00),
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          minimumSize: Size(
                            double.infinity,
                            50,
                          ), // Lebar penuh, tinggi 50
                        ),
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15, // Perbesar teks
                            fontWeight: FontWeight.bold, // Buat lebih tegas
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Belum punya akun? ",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              color: Color(0xffA8A8A8),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthRegister(),
                                ),
                              );
                            },
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                color: Color(0xfff1F5460),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(thickness: 1, color: primaryColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Atau",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Expanded(
                            child: Divider(thickness: 1, color: primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(225, 255, 255, 255),
                            foregroundColor: Color.fromARGB(255, 0, 0, 0),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          icon: SvgPicture.asset(
                            "assets/icon/google.svg",
                            width: 20,
                            height: 20,
                          ),
                          label: Text(
                            "Masuk dengan Google",
                            style: TextStyle(fontFamily: "Inter", fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
