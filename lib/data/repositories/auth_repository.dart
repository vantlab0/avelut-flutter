import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avelut_flutter/core/network/supabase_client.dart';
import 'package:avelut_flutter/core/storage/secure_storage.dart';
import 'package:avelut_flutter/data/models/user_profile.dart';

/// Auth repository — wraps Supabase auth + profile sync.
class AuthRepository {
  AuthRepository(this._ref);

  final Ref _ref;

  /// Sign in with email + password.
  Future<UserProfile> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await AvelutSupabaseClient.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Sign in failed: no user returned');
    }

    final profile = await _fetchProfile(response.user!.id);
    await SecureStorage().write('access_token', response.session?.accessToken ?? '');
    await SecureStorage().write('refresh_token', response.session?.refreshToken ?? '');
    return profile;
  }

  /// Sign up with email + password.
  Future<UserProfile> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final response = await AvelutSupabaseClient.client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );

    if (response.user == null) {
      throw Exception('Sign up failed: no user returned');
    }

    final profile = await _fetchProfile(response.user.id);
    return profile;
  }

  /// Sign out.
  Future<void> signOut() async {
    await SecureStorage().deleteAll();
    await AvelutSupabaseClient.client.auth.signOut();
  }

  /// Reset password via email.
  Future<void> resetPassword(String email) async {
    await AvelutSupabaseClient.client.auth.resetPasswordForEmail(email);
  }

  /// Sign in with Google (web native / mobile deep link).
  Future<void> signInWithGoogle() async {
    await AvelutSupabaseClient.client.auth.signInWithOAuth(
      OAuthProvider.google,
    );
  }

  Future<UserProfile> _fetchProfile(String userId) async {
    final response = await AvelutSupabaseClient.client
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();

    return UserProfile.fromJson(response);
  }
}

/// Provider for the auth repository.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref);
});
