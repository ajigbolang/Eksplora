import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eksplora/screen/edit_profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Profile
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 35),
            color: const Color(0xffFF6F00),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Color(0xffFF6F00)),
                ),
                const SizedBox(height: 0),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          foregroundColor: primaryColor,
                        ),
                        child: const Text(
                          "Edit Akun",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //* Body Profile
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color:
                    Colors.white, // Tambahin warna putih biar nggak transparan
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileField("Nama Lengkap", "Muhammad Risayd Wibawa"),
                  _buildProfileField("Username", "Rchadd"),
                  _buildProfileField("Email", "risyad006@gmail.com"),
                  _buildProfileField("Nomor HP", "082118681211"),
                  const SizedBox(height: 15),
                  const Text(
                    "Umum",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  //* Menu Pusat Bantuan
                  _buildMenuItem(
                    icon: const HeroIcon(
                      HeroIcons.questionMarkCircle,
                      color: Color(0xffA8A8A8),
                    ),
                    text: "Pusat Bantuan",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqScreen(),
                        ),
                      );
                    },
                  ),

                  //* Menu Kontak Kami
                  _buildMenuItem(
                    icon: const HeroIcon(
                      HeroIcons.phone,
                      color: Color(0xffA8A8A8),
                    ),
                    text: "Kontak Kami",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactScreen(),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  //* Tombol Keluar
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFC599),
                      foregroundColor: Color(0xffB24E00),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Keluar",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //* Widget untuk field profil (Nama, Email, dll.)
  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value, style: TextStyle(color: Colors.grey.shade600)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  //* Widget untuk menu item
  Widget _buildMenuItem({
    required Widget icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xffA8A8A8),
            ),
          ],
        ),
      ),
    );
  }
}

//*HALAMAN FAQ - PERTANYAAN UMUM
class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqList = [
      {
        "question": "Apa itu Eksplora?",
        "answer": "Eksplora adalah aplikasi penyewaan alat camping",
      },
      {
        "question": "Apa itu Eksplora?",
        "answer": "Eksplora adalah aplikasi penyewaan alat camping",
      },
      {
        "question": "Apa itu Eksplora?",
        "answer": "Eksplora adalah aplikasi penyewaan alat camping",
      },
      {
        "question": "Apa itu Eksplora?",
        "answer": "Eksplora adalah aplikasi penyewaan alat camping",
      },
      {
        "question": "Apa itu Eksplora?",
        "answer": "Eksplora adalah aplikasi penyewaan alat camping",
      },
      {
        "question": "Apa itu Eksplora?",
        "answer": "Eksplora adalah aplikasi penyewaan alat camping",
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text(
          "FAQ - Pertanyaan Umum",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: fourthColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const HeroIcon(HeroIcons.arrowLeft, color: fourthColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: faqList.length,
        separatorBuilder:
            (context, index) =>
                const Divider(color: Color.fromARGB(255, 0, 0, 0)),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faqList[index]["question"]!,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 112, 128),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                faqList[index]["answer"]!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

//** TAMPILAN UMUM (Pusat Bantuan & Kontak Kami) **//

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Fungsi buka WhatsApp
  void _launchWhatsApp() async {
    final Uri url = Uri.parse("https://wa.me/6282118681215");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch WhatsApp");
    }
  }

  // Fungsi buka Instagram
  void _launchInstagram() async {
    final Uri url = Uri.parse("https://www.instagram.com/KatapangOutdoor");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch Instagram");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text(
          "Kontak Eksplora",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff003C3C),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff003C3C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nomor Telpon:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: fourthColor,
              ),
            ),
            GestureDetector(
              onTap: _launchWhatsApp,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "+6282118681215",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "Inter",
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icon/whatsapp.svg',
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.black),

            const SizedBox(height: 15),

            const Text(
              "Instagram:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: fourthColor,
              ),
            ),
            GestureDetector(
              onTap: _launchInstagram,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "@KatapangOutdoor",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "Inter",
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icon/instagram.svg',
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }
}
