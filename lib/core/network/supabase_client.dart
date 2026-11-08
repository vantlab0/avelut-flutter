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

  /// Realtime channel helper.
  RealtimeChannel channel(String channelName, {
    Function(RealtimeSubscribeStatus, dynamic)? onConnect,
  }) =>
      client.channel(channelName, onConnect: onConnect);

  /// Remove a realtime channel.
  Future<void> removeChannel(RealtimeChannel channel) =>
      client.removeChannel(channel);

  /// Storage bucket access.
  StorageClient get storage => client.storage;

  /// Call a Postgres RPC function.
  Future<PostgrestFilterBuilder> rpc(String functionName, {Map<String, dynamic>? params}) =>
      client.rpc(functionName, params: params);
}
