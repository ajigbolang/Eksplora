import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:eksplora/screen/auth_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eksplora/screen/create_account_success.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({super.key});

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
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
                          MaterialPageRoute(builder: (context) => AuthLogin()),
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
                          MaterialPageRoute(builder: (context) => AuthLogin()),
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
                        "Selamat datang",
                        style: TextStyle(
                          letterSpacing: -0.5,
                          fontFamily: "Inter",
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff1F5460),
                        ),
                      ),
                      Text(
                        "Silahkan daftar untuk menggunakan aplikasi!",
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
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Nama Lengkap",
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
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Username",
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
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
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
                              'assets/icon/email.svg',
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
                      SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Nomor HP",
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
                              'assets/icon/phone.svg',
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
                      SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAccountSuccess(),
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
                            "Daftar",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15, // Perbesar teks
                              fontWeight: FontWeight.bold, // Buat lebih tegas
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
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
