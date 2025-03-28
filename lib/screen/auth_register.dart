import 'package:eksplora/Auth/auth_service.dart';
import 'package:eksplora/constant/constant.dart';
import 'package:eksplora/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:eksplora/screen/auth_login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({super.key});

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  //get auth service
  final authService = AuthService();

  // Text Controllers untuk Register
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //Sign up button/pressed
  void signUp() async {
    // Ambil data dari TextControllers
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // Cek konfirmasi password apakah sesuai
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Password tidak sesuai")));
      return;
    }

    try {
      // Panggil AuthService untuk registrasi
      await authService.signUpWithEmailPassword(
        email,
        password,
        name,
        username,
        phone.isNotEmpty ? phone : null, // Pastikan phone opsional
      );

      // Jika sukses, kembali ke halaman sebelumnya (login)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registrasi berhasil! Silakan login.")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      // Tangani error
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

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
                      SizedBox(height: 10),
                      Text(
                        "Silahkan daftar untuk menggunakan aplikasi!",
                        style: TextStyle(
                          letterSpacing: -0.2,
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: thirdColor,
                        ),
                      ),
                      SizedBox(height: 35),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Nama Lengkap",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/user.svg',
                              width: 20,
                              height: 20,
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
                        controller: _usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Username",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/user.svg',
                              width: 20,
                              height: 20,
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
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
                        controller: _phoneController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Nomor HP",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/phone.svg',
                              width: 20,
                              height: 20,
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
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Kata Sandi",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/lock-open.svg',
                              width: 20,
                              height: 20,
                              color: thirdColor,
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
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(225, 242, 242, 242),
                          labelText: "Konfirmasi Kata Sandi",
                          labelStyle: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: thirdColor,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                              12,
                            ), // Sesuaikan padding agar ikon tidak terlalu besar
                            child: SvgPicture.asset(
                              'assets/icon/lock-closed.svg',
                              width: 20,
                              height: 20,
                              color: thirdColor,
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
                          onPressed: signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffff6f00),
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            minimumSize: Size(
                              double.infinity,
                              60,
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
