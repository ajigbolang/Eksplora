import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: Column(
        children: [
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, '/admin/dashboard');
            },
          ),
          ListTile(
            title: Text('Manajemen Produk'),
            onTap: () {
              Navigator.pushNamed(context, '/admin/products');
            },
          ),
        ],
      ),
    );
  }
}
