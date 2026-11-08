import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:avelut_flutter/core/theme/app_theme.dart';
import 'package:avelut_flutter/presentation/navigation/app_router.dart';
import 'package:avelut_flutter/presentation/state/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL', defaultValue: ''),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: ''),
    realtimeUrl: const String.fromEnvironment(
      'SUPABASE_REALTIME_URL',
      defaultValue: '',
    ),
  );

  runApp(const ProviderScope(child: AvelutApp()));
}

class AvelutApp extends ConsumerWidget {
  const AvelutApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Avelut',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
      builder: (context, child) {
        return SafeArea(child: child ?? const SizedBox.shrink());
      },
    );
  }
}
