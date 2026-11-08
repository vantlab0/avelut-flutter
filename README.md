# AVELUT Flutter (custom rebuild)

Rebuilding the Avelut study app from scratch in Flutter with a glassmorphism + squircle design language.

## Stack
- Flutter + Riverpod + go_router
- Supabase (auth, realtime DB, storage, Edge Functions)
- Local SQLite cache + secure token storage
- Firebase Cloud Messaging + local notifications
- Google ML Kit (OCR / scan & solve)
- Audio: record + just_audio (voice tutorials & voice notes)

## Design language
- Colors: off-black (#0F0F0F), off-white (#FAFAFA), white, black, grays
- Glassmorphism: backdrop blur, hairline borders, semi-transparent surfaces
- Squircle shapes on every element
- Typography: Inter / SF Pro

## Setup

1. Install Flutter (stable): https://docs.flutter.dev/get-started/install
2. Enable desktop/mobile as desired:
   ```bash
   flutter config --enable-android
   flutter config --enable-ios
   ```
3. Copy env and fill in Supabase credentials:
   ```bash
   cp .env.example .env
   ```
4. Pass Supabase credentials at build (recommended) or export them:
   ```bash
   export SUPABASE_URL=your_url
   export SUPABASE_ANON_KEY=your_anon_key
   flutter run
   ```
   Or use `--dart-define`:
   ```bash
   flutter run --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...
   ```
5. Install dependencies:
   ```bash
   flutter pub get
   flutter pub run build_runner build
   ```
6. Configure Firebase (iOS/Android) for push notifications:
   - Add `GoogleService-Info.plist` to `ios/Runner/`
   - Add `google-services.json` to `android/app/`

## Project structure

```
lib/
  core/            theme, network (Supabase), secure storage, constants, utils
  data/            models (freezed/json_serializable), repositories, datasources
  domain/          entities, repository interfaces, use cases
  presentation/    screens, widgets, navigation (go_router), state (Riverpod)
  services/        voice, AI, OCR, notifications, whiteboard
```

## Build order
1. Scaffold + theme + auth (done — this scaffold)
2. Supabase auth screens + profile
3. Core AI chat (streaming, realtime)
4. Study guide hierarchy
5. Live tutorial + whiteboard (differentiator)
6. Messenger
7. Notebooks + playground
8. Profile / settings / billing
9. Admin panel
10. Native polish (push, OCR, voice, haptics)

## Notes
- `morluto/rea` is a reverse-engineering toolkit, not a Flutter builder. It can fingerprint a compiled Flutter APK later but does not generate Flutter code.
- This is a custom Flutter build (not FlutterFlow), giving full control over the whiteboard, voice, and glassmorphism design.