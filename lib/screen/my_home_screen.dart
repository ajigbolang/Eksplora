import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:eksplora/Widget/my_icon_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eksplora/Widget/banner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String category = "All"; // Default kategori
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> categoriesItems = [];

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Ambil kategori saat pertama kali
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
      backgroundColor:
          Colors.white, // Ganti secondColor jika belum didefinisikan
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerParts(), // Pastikan function ini ada
                mySearchBar(), // Pastikan function ini ada
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
        filled: true,
        prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass),
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: "Cari di sini...",
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// ** Header bagian atas (nama + icon notifikasi)**
Row headerParts() {
  return Row(
    children: [
      const Text(
        "Hi, Risyad",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1),
      ),
      const Spacer(),
      MyIconButton(icon: Iconsax.notification, pressed: () {}),
    ],
  );
}
