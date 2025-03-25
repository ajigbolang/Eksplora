import 'package:eksplora/screen/home_screen.dart';
import 'package:eksplora/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //Listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,

      //Build apppropriate page on auth based
      builder: (context, snapshot) {
        //Loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        //check if there is a valid session currently?
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          //If there is no session, navigate to Home page
          return const HomeScreen();
        } else {
          //If there is a session, navigate to Login page
          return const SplashScreen();
        }
      },
    );
  }
}
