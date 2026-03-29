import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/providers/auth_provider.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/opportunities/screens/opportunities_list_screen.dart';
import '../features/opportunities/screens/opportunity_detail_screen.dart';
import '../features/hours/screens/my_hours_screen.dart';
import '../features/hours/screens/log_hours_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/ai_assistant/screens/ai_chat_screen.dart';
import '../shared/widgets/main_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }
      if (isLoggedIn && isAuthRoute) {
        return '/opportunities';
      }
      return null;
    },
    routes: [
      // Auth routes (no shell)
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // Main app with bottom navigation shell
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Opportunities
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/opportunities',
                builder: (context, state) =>
                    const OpportunitiesListScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return OpportunityDetailScreen(
                        opportunityId: id,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          // Branch 1: My Hours
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/hours',
                builder: (context, state) => const MyHoursScreen(),
                routes: [
                  GoRoute(
                    path: 'log',
                    builder: (context, state) =>
                        const LogHoursScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 2: AI Assistant
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/ai-chat',
                builder: (context, state) => const AiChatScreen(),
              ),
            ],
          ),

          // Branch 3: Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
