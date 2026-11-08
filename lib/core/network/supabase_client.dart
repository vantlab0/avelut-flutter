import 'package:supabase_flutter/supabase_flutter.dart';

/// Centralized Supabase client access.
/// Initialize once in main.dart via Supabase.initialize(...).
class AvelutSupabaseClient {
  AvelutSupabaseClient._();

  /// Shortcut to the underlying Supabase client.
  static SupabaseClient get client => Supabase.instance.client;

  /// Auth stream — emits the current session (null when signed out).
  Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;

  /// Current session, or null if not signed in.
  Session? get currentSession => client.auth.currentSession;

  /// Current user, or null if not signed in.
  User? get currentUser => client.auth.currentUser;

  /// Storage bucket access.
  StorageClient get storage => client.storage;
}
