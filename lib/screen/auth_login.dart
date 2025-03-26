import 'package:eksplora/Auth/auth_gate.dart';
import 'package:eksplora/Auth/auth_service.dart';
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
  //*Mengambil data dari auth_service
  final authService = AuthService();

  //*Text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //*Login button function/pressed
  void login() async {
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    //atempt login
    try {
      await authService.signInWithEmailPassword(email, password);
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => AuthGate()));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: primaryColor,
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
                      SizedBox(height: 10),
                      Text(
                        "Silakan masuk dan dapatkan bantuan darurat Anda!",
                        style: TextStyle(
                          letterSpacing: -0.2,
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: thirdColor,
                        ),
                      ),
                      SizedBox(height: 49),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: false,
                          labelText: "Email",
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
                              'assets/icon/mail.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: thirdColor),
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
                        controller: _passwordController,
                        obscureText:
                            _isObscured, // Sensor atau tampilkan password
                        decoration: InputDecoration(
                          filled: false,
                          labelText: "Kata Sandi",
                          labelStyle: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              'assets/icon/lock-open.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: thirdColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffFF6F00),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            icon: SvgPicture.asset(
                              _isObscured
                                  ? 'assets/icon/eye-close.svg'
                                  : 'assets/icon/eye-open.svg',
                              width: 20,
                              height: 20,
                              color: thirdColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffff6f00),
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          minimumSize: Size(
                            double.infinity,
                            60,
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
                              fontWeight: FontWeight.w700,
                              color: thirdColor,
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
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
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
