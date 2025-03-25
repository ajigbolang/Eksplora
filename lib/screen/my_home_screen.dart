import 'package:eksplora/Auth/auth_service.dart';
import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:eksplora/Widget/my_icon_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eksplora/Widget/banner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:eksplora/screen/notification_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  //* get auth service
  final authService = AuthService();

  List<Map<String, dynamic>>? assignments;
  Map<String, dynamic>? userData;
  String? name;
  String? email;

  String category = "All"; // Default kategori
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> categoriesItems = [];

  @override
  void initState() {
    super.initState();
    getUserData();
    Map result = authService.getUserCurrentEmail();
    name = result['name'];
    email = result['email'];
    getAssignments();

    fetchCategories(); // Ambil kategori saat pertama kali
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getUserData() async {
    final response = await authService.getCurrentUserData();
    setState(() {
      userData = response;
    });
  }

  void getAssignments() async {
    setState(() {
      // Indicate loading state
      assignments = null;
    });
  }

  Future<void> fetchCategories() async {
    try {
      final response = await supabase.from('kategori').select();
      print("🔥 Data kategori dari Supabase: $response"); // Debugging

      if (response.isNotEmpty) {
        if (mounted) {
          setState(() {
            categoriesItems =
                response
                    .map(
                      (e) => {
                        'id':
                            (e['id'] as num)
                                .toInt(), // Pastikan `id` jadi `int`
                        'nama':
                            e['nama'] as String, // Pastikan `nama` tetap String
                      },
                    )
                    .toList();
          });
        }
      } else {
        print("⚠️ Tidak ada data kategori yang ditemukan.");
      }
    } catch (e) {
      print("❌ Error fetch kategori: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffFAFAFA,
      ), // Ganti secondColor jika belum didefinisikan
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        const Text(
                          "Selamat datang!",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          "Halo, ${userData != null ? userData!['full_name'] : '-'}",
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff4D4D4D),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Builder(
                      builder:
                          (context) => MyIconButton(
                            icon: HeroIcon(
                              HeroIcons.bell,
                              style: HeroIconStyle.solid,
                              color: Color(0xffA8A8A8),
                            ),
                            pressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const NotificationScreen(),
                                ),
                              );
                            },
                          ),
                    ),
                  ],
                ), // Pastikan function ini ada
                //* Tombol Search di HomeScreen
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(
                          12,
                        ), // Sesuaikan padding agar ikon tidak terlalu besar
                        child: SvgPicture.asset(
                          'assets/icon/search.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Cari di sini...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: thirdColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: thirdColor),
                      ),
                    ),
                  ),
                ), // Pastikan function ini ada
                const BannerToExplore(), // Pastikan ini widget yang valid
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Kategori",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                selectedCategory(), // Widget kategori yang lo buat
                const SizedBox(height: 10),
                const Text(
                  "Mantap",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Lihat semua",
                    style: TextStyle(
                      color:
                          Colors
                              .blue, // Ganti fourthColor jika belum didefinisikan
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ** Widget StreamBuilder untuk menampilkan kategori**
  Widget selectedCategory() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: supabase
          .from('kategori')
          .select()
          .then((data) => List<Map<String, dynamic>>.from(data)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("Tidak ada kategori."));
        }

        final kategoriList = snapshot.data!;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                kategoriList.map((kategori) {
                  bool isSelected = category == kategori["nama"];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        category = kategori["nama"];
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: isSelected ? fourthColor : Colors.white,
                        border: Border.all(
                          color:
                              isSelected
                                  ? Colors.transparent
                                  : Colors.grey.shade400,
                          width: 1.5,
                        ),
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: fourthColor.withOpacity(0.5),
                                    blurRadius: 1,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                                : [],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        kategori["nama"],
                        style: TextStyle(
                          color:
                              isSelected ? Colors.white : Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}

// ** Widget Search Bar**
Padding mySearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 22),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(
            12,
          ), // Sesuaikan padding agar ikon tidak terlalu besar
          child: SvgPicture.asset(
            'assets/icon/search.svg',
            width: 20,
            height: 20,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: "Cari di sini...",
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: thirdColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: thirdColor),
        ),
      ),
    ),
  );
}
