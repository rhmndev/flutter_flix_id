import 'package:flutter_flix_id/presentation/pages/login_page/login_page.dart';
import 'package:flutter_flix_id/presentation/pages/main_page/main_page.dart';
import 'package:flutter_flix_id/presentation/pages/register_page/register_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
  routes: [
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
    ),
  ],
  initialLocation: '/login',
  debugLogDiagnostics: false,
);
