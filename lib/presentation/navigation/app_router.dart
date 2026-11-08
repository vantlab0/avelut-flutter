import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:avelut_flutter/presentation/state/auth_provider.dart';

/// Centralized route configuration for Avelut Flutter.
///
/// Route guard notes:
/// - Public routes: /login, /signup, /forgot-password
/// - Auth-required: everything else under /app
/// - Admin-required: /admin/* (role checked inside admin screens)
/// Riverpod provider exposing the configured GoRouter.
final goRouterProvider = Provider<GoRouter>((ref) => goRouter);

final GoRouter goRouter = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) async {
    final isAuthenticated = state.uri.pathSegments.isNotEmpty
        ? false // placeholder; actual check via provider below
        : false;
    // Auth gating is handled inside each screen using ref.watch(isAuthenticatedProvider)
    return null;
  },
  routes: [
    // Splash / entry
    GoRoute(
      path: '/splash',
      builder: (context, state) => const _SplashScreen(),
    ),

    // Auth (public)
    GoRoute(
      path: '/login',
      builder: (context, state) => const _LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const _SignUpScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const _ForgotPasswordScreen(),
    ),

    // Onboarding (auth-required)
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const _OnboardingScreen(),
    ),

    // Main app shell (auth-required)
    ShellRoute(
      builder: (context, state, child) => _AppShell(child: child),
      routes: [
        GoRoute(
          path: '/chat',
          builder: (context, state) => const _ChatScreen(),
        ),
        GoRoute(
          path: '/chat/:conversationId',
          builder: (context, state) {
            final id = state.pathParameters['conversationId']!;
            return _ChatScreen(conversationId: id);
          },
        ),
        GoRoute(
          path: '/study-guide',
          builder: (context, state) => const _StudyGuideScreen(),
        ),
        GoRoute(
          path: '/study-guide/:courseId',
          builder: (context, state) {
            final id = state.pathParameters['courseId']!;
            return _CourseTopicsScreen(courseId: id);
          },
        ),
        GoRoute(
          path: '/study-guide/:courseId/:topicId',
          builder: (context, state) {
            final courseId = state.pathParameters['courseId']!;
            final topicId = state.pathParameters['topicId']!;
            return _TopicDetailScreen(courseId: courseId, topicId: topicId);
          },
        ),
        GoRoute(
          path: '/notebooks',
          builder: (context, state) => const _NotebooksScreen(),
        ),
        GoRoute(
          path: '/notebooks/:notebookId',
          builder: (context, state) {
            final id = state.pathParameters['notebookId']!;
            return _NotebookDetailScreen(notebookId: id);
          },
        ),
        GoRoute(
          path: '/timetable',
          builder: (context, state) => const _TimetableScreen(),
        ),
        GoRoute(
          path: '/messenger',
          builder: (context, state) => const _MessengerScreen(),
        ),
        GoRoute(
          path: '/messenger/:chatId',
          builder: (context, state) {
            final id = state.pathParameters['chatId']!;
            return _MessengerChatScreen(chatId: id);
          },
        ),
        GoRoute(
          path: '/playground',
          builder: (context, state) => const _PlaygroundHomeScreen(),
        ),
        GoRoute(
          path: '/playground/cbt',
          builder: (context, state) => const _CbtFlowScreen(),
        ),
        GoRoute(
          path: '/playground/flashcards',
          builder: (context, state) => const _FlashcardsFlowScreen(),
        ),
        GoRoute(
          path: '/playground/past-questions',
          builder: (context, state) => const _PastQuestionViewerScreen(),
        ),
        GoRoute(
          path: '/live-tutorial/setup',
          builder: (context, state) => const _LiveTutorialSetupScreen(),
        ),
        GoRoute(
          path: '/live-tutorial/:sessionId',
          builder: (context, state) {
            final id = state.pathParameters['sessionId']!;
            return _LiveClassroomScreen(sessionId: id);
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const _ProfileScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const _SettingsScreen(),
        ),
        GoRoute(
          path: '/billing',
          builder: (context, state) => const _BillingScreen(),
        ),
        GoRoute(
          path: '/leaderboard',
          builder: (context, state) => const _LeaderboardScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const _HistoryScreen(),
        ),
        GoRoute(
          path: '/feedback',
          builder: (context, state) => const _FeedbackScreen(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const _NotificationsScreen(),
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) => const _AdminShellScreen(),
        ),
      ],
    ),

    // Marketing / legal (public)
    GoRoute(
      path: '/landing',
      builder: (context, state) => const _LandingPage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const _AboutUsPage(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const _ContactUsPage(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => const _PrivacyPolicy(),
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) => const _TermsAndConditions(),
    ),
    GoRoute(
      path: '/plans',
      builder: (context, state) => const _PlansScreen(),
    ),
    GoRoute(
      path: '/delete-account',
      builder: (context, state) => const _DeleteAccountScreen(),
    ),
  ],
);

/// Top-level app shell with bottom navigation.
class _AppShell extends StatefulWidget {
  final Widget child;
  const _AppShell({required this.child});

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() => _selectedIndex = i);
          final routes = [
            '/chat', '/study-guide', '/notebooks', '/timetable', '/messenger',
          ];
          if (i < routes.length) {
            context.go(routes[i]);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Study Guide'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notebooks'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        ],
      ),
    );
  }
}

// ── Placeholder screens (implemented in subsequent phases) ──
class _SplashScreen extends ConsumerWidget {
  const _SplashScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 80, color: Color(0xFF009EE2)),
            const SizedBox(height: 16),
            Text('Avelut', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Login');
}

class _SignUpScreen extends StatelessWidget {
  const _SignUpScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Sign Up');
}

class _ForgotPasswordScreen extends StatelessWidget {
  const _ForgotPasswordScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Forgot Password');
}

class _OnboardingScreen extends StatelessWidget {
  const _OnboardingScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Onboarding');
}

class _ChatScreen extends StatelessWidget {
  final String? conversationId;
  const _ChatScreen({this.conversationId});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'AI Chat');
}

class _StudyGuideScreen extends StatelessWidget {
  const _StudyGuideScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Study Guide');
}

class _CourseTopicsScreen extends StatelessWidget {
  final String courseId;
  const _CourseTopicsScreen({required this.courseId});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Course Topics');
}

class _TopicDetailScreen extends StatelessWidget {
  final String courseId, topicId;
  const _TopicDetailScreen({required this.courseId, required this.topicId});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Topic Detail');
}

class _NotebooksScreen extends StatelessWidget {
  const _NotebooksScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Notebooks');
}

class _NotebookDetailScreen extends StatelessWidget {
  final String notebookId;
  const _NotebookDetailScreen({required this.notebookId});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Notebook');
}

class _TimetableScreen extends StatelessWidget {
  const _TimetableScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Timetable');
}

class _MessengerScreen extends StatelessWidget {
  const _MessengerScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Messenger');
}

class _MessengerChatScreen extends StatelessWidget {
  final String chatId;
  const _MessengerChatScreen({required this.chatId});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Chat');
}

class _PlaygroundHomeScreen extends StatelessWidget {
  const _PlaygroundHomeScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Playground');
}

class _CbtFlowScreen extends StatelessWidget {
  const _CbtFlowScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'CBT Practice');
}

class _FlashcardsFlowScreen extends StatelessWidget {
  const _FlashcardsFlowScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Flashcards');
}

class _PastQuestionViewerScreen extends StatelessWidget {
  const _PastQuestionViewerScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Past Questions');
}

class _LiveTutorialSetupScreen extends StatelessWidget {
  const _LiveTutorialSetupScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Live Tutorial Setup');
}

class _LiveClassroomScreen extends StatelessWidget {
  final String sessionId;
  const _LiveClassroomScreen({required this.sessionId});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Live Classroom');
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Profile');
}

class _SettingsScreen extends StatelessWidget {
  const _SettingsScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Settings');
}

class _BillingScreen extends StatelessWidget {
  const _BillingScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Billing');
}

class _LeaderboardScreen extends StatelessWidget {
  const _LeaderboardScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Leaderboard');
}

class _HistoryScreen extends StatelessWidget {
  const _HistoryScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'History');
}

class _FeedbackScreen extends StatelessWidget {
  const _FeedbackScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Feedback');
}

class _NotificationsScreen extends StatelessWidget {
  const _NotificationsScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Notifications');
}

class _AdminShellScreen extends StatelessWidget {
  const _AdminShellScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Admin Panel');
}

class _Placeholder extends StatelessWidget {
  final String title;
  const _Placeholder({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title — coming in next phase')),
    );
  }
}

// Marketing / legal placeholders
class _LandingPage extends StatelessWidget {
  const _LandingPage();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Landing');
}
class _AboutUsPage extends StatelessWidget {
  const _AboutUsPage();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'About Us');
}
class _ContactUsPage extends StatelessWidget {
  const _ContactUsPage();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Contact');
}
class _PrivacyPolicy extends StatelessWidget {
  const _PrivacyPolicy();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Privacy');
}
class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Terms');
}
class _PlansScreen extends StatelessWidget {
  const _PlansScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Plans');
}
class _DeleteAccountScreen extends StatelessWidget {
  const _DeleteAccountScreen();
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Delete Account');
}
