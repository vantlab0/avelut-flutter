import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Centralized Supabase client access.
/// Initialize once in main.dart via Supabase.initialize(...).
class SupabaseClient {
  SupabaseClient._();

  /// The underlying Supabase client.
  static SupabaseClient get _instance => Supabase.instance.client;

  /// Shortcut to the client.
  static SupabaseClient? get client => _instance;

  /// Auth stream — emits the current session (null when signed out).
  Stream<AuthState> get authStateChanges => _instance.auth.onAuthStateChange;

  /// Current session, or null if not signed in.
  Session? get currentSession => _instance.auth.currentSession;

  /// Current user, or null if not signed in.
  User? get currentUser => _instance.auth.currentUser;

  /// Realtime channel helper.
  RealtimeChannel channel(String channelName, {
    Function(RealtimeSubscribeStatus, dynamic)? onConnect,
  }) =>
      _instance.channel(channelName, onConnect: onConnect);

  /// Remove a realtime channel.
  Future<void> removeChannel(RealtimeChannel channel) =>
      _instance.removeChannel(channel);

  /// Storage bucket access.
  StorageClient get storage => _instance.storage;

  /// Call a Postgres RPC function.
  Future<PostgrestFilterBuilder> rpc(String functionName, {Map<String, dynamic>? params}) =>
      _instance.rpc(functionName, params: params);
}
