import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avelut_flutter/core/network/supabase_client.dart';

/// Stream of auth state changes from Supabase.
final authStateProvider = StreamProvider<AuthState>((ref) {
  return SupabaseClient.client!.authStateChanges;
});

/// Current authenticated user (nullable).
final currentUserProvider = Provider<User?>((ref) {
  return SupabaseClient.client!.currentUser;
});

/// Whether the user is currently signed in.
final isAuthenticatedProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
});
