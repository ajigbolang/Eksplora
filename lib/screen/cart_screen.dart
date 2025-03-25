import 'package:eksplora/constant/constant.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Tenda Dome Kapasitas 5 Orang',
      'price': 60000,
      'image': 'assets/image/tenda.png',
      'selected': false,
    },
    {
      'name': 'Tenda Dome Kapasitas 10 Orang',
      'price': 95000,
      'image': 'assets/image/tenda.png',
      'selected': false,
    },
  ];

  bool selectAll = false;

  // Getter untuk menghitung total harga secara dinamis
  int get totalPrice => cartItems
      .where((item) => item['selected'])
      .fold(0, (sum, item) => sum + (item['price'] as num).toInt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Keranjang Saya",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            color: fourthColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: fourthColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          cartItems.isEmpty
              ? const Center(
                child: Text(
                  "Keranjang Anda saat ini kosong.",
                  style: TextStyle(fontFamily: "Inter"),
                ),
              )
              : Column(
                children: [
                  CheckboxListTile(
                    title: const Text(
                      "Pilih Semua",
                      style: TextStyle(fontFamily: "Inter"),
                    ),
                    value: selectAll,
                    onChanged: (bool? value) {
                      setState(() {
                        selectAll = value!;
                        for (var item in cartItems) {
                          item['selected'] = selectAll;
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        var item = cartItems[index];
                        return ListTile(
                          leading: Image.asset(
                            item['image'],
                            width: 60,
                            height: 60,
                          ),
                          title: Text(item['name']),
                          subtitle: Text("Rp.${item['price']},-"),
                          trailing: Checkbox(
                            value: item['selected'],
                            onChanged: (bool? value) {
                              setState(() {
                                item['selected'] = value!;
                                selectAll = cartItems.every(
                                  (item) => item['selected'],
                                );
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Pembayaran",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rp.${totalPrice},-",
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: totalPrice > 0 ? () {} : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            "Sewa Sekarang",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
