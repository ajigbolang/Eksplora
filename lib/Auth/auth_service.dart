import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in session
  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw AuthException(
        e.toString(),
      ); // Lempar error biar bisa ditangkap di UI
    }
  }

  //Sign UP session
  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password,
    String name,
    String username,
    String? phone,
  ) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          "name": name,
          "username": username,
          if (phone != null) "phone": phone,
        },
      );
      return response;
    } catch (e) {
      throw AuthException(e.toString()); //jika ada error maka akan muncul di UI
    }
  }

  // LogOut session
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get user email
  Map<String, String?> getUserCurrentEmail() {
    final user = _supabase.auth.currentUser;
    if (user == null) return {};

    return {'email': user.email, 'name': user.userMetadata?['Name']};
  }

  Future<Map<String, dynamic>?> getCurrentUserData() async {
    final user = _supabase.auth.currentUser;

    if (user == null) return null;

    return {
      'id': user.id,
      'email': user.email,
      'full_name': user.userMetadata?['Name'] ?? '-',
      'created_at': user.createdAt,
    };
  }

  Future<void> updateDisplayName(String newName) async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    final response = await _supabase.auth.updateUser(
      UserAttributes(data: {'Name': newName}), //sesuai dengan key di signUp
    );

    if (response.user != null) {
      debugPrint('User updated successfully');
    } else {
      debugPrint('Failed to update user');
    }
  }
}
