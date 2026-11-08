/// Application-wide constants for Avelut Flutter.
library app_constants;

/// Supabase configuration keys (loaded from .env at runtime).
class SupabaseConfig {
  SupabaseConfig._();

  static const String urlKey = 'SUPABASE_URL';
  static const String anonKeyKey = 'SUPABASE_ANON_KEY';
  static const String realtimeUrlKey = 'SUPABASE_REALTIME_URL';
}

/// Storage bucket names.
class StorageBucket {
  StorageBucket._();

  static const String uploads = 'uploads';
}

/// Secure storage keys.
class SecureKey {
  SecureKey._();

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String fcmToken = 'fcm_token';
  static const String userProfile = 'user_profile';
}

/// Default pagination limit.
const int defaultPageLimit = 20;

/// Maximum image attachments per message.
const int maxImageAttachments = 6;

/// AI credit defaults.
const int defaultAiCredits = 50;
const int defaultLiveTutorialMinutes = 120;
