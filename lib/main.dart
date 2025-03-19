import 'package:eksplora/screen/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  //* supabase setup
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://fkvolhvpwlvkhtgbpcim.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZrdm9saHZwd2x2a2h0Z2JwY2ltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIzNTIyMDAsImV4cCI6MjA1NzkyODIwMH0.Q1AXSuO9Uuf--Uyd1Iv6v9NvKCCvrNPZ-bXB9udg2KE",
  );

  // run app
  runApp(const MyApp());
}

//* Memudahkan akses atau import database
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Eksplora', home: HomeScreen());
  }
}
