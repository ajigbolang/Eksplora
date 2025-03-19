import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:eksplora/constant/constant.dart';
import 'package:eksplora/screen/my_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      const MyHomeScreen(),
      navBarPage(HeroIcons.shoppingCart),
      navBarPage(HeroIcons.user),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondColor,
        elevation: 0,
        iconSize: 28,
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: HeroIcon(
              selectedIndex == 0 ? HeroIcons.home : HeroIcons.home,
            ),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(
              selectedIndex == 1
                  ? HeroIcons.shoppingCart
                  : HeroIcons.shoppingCart,
            ),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(
              selectedIndex == 2 ? HeroIcons.user : HeroIcons.user,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }

  navBarPage(dynamic iconName) {
    return Center(
      child:
          iconName
                  is HeroIcons // Jika pakai HeroIcons
              ? HeroIcon(
                iconName,
                size: 100,
                color: primaryColor,
                style: HeroIconStyle.solid, // Bisa diubah ke outline
              )
              : Icon(
                iconName, // Jika pakai Iconsax atau Material Icons
                size: 100,
                color: primaryColor,
              ),
    );
  }
}
