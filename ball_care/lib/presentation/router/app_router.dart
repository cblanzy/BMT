import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/add_ball_screen.dart';
import '../screens/edit_ball_screen.dart';
import '../screens/ball_detail_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/add_game_log_screen.dart';
import '../screens/add_maintenance_screen.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/terms_of_service_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/add-ball',
      builder: (context, state) => const AddBallScreen(),
    ),
    GoRoute(
      path: '/ball/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BallDetailScreen(ballId: id);
      },
    ),
    GoRoute(
      path: '/ball/:id/edit',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return EditBallScreen(ballId: id);
      },
    ),
    GoRoute(
      path: '/ball/:id/add-log',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return AddGameLogScreen(ballId: id);
      },
    ),
    GoRoute(
      path: '/ball/:id/add-maintenance',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return AddMaintenanceScreen(ballId: id);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/privacy-policy',
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: '/terms-of-service',
      builder: (context, state) => const TermsOfServiceScreen(),
    ),
  ],
);
