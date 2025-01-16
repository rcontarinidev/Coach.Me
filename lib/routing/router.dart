import 'package:coach_me/routing/routes.dart';
import 'package:coach_me/ui/login/widgets/login_screen.dart';
import 'package:coach_me/ui/register/widgets/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/auth_repository.dart';

GoRouter router(
  AuthRepository authRepository,
) =>
    GoRouter(
        initialLocation: Routes.login,
        debugLogDiagnostics: true,
        redirect: _redirect,
        refreshListenable: authRepository,
        routes: [
          GoRoute(
              path: Routes.login,
              builder: (context, state) {
                return LoginScreen();
              }),
          GoRoute(
            path: Routes.register,
            builder: (context, state) {
              return RegisterScreen();
            }
          )
        ]);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
 /* if (loggingIn) {
    return Routes.home;
  }
*/
  // no need to redirect at all
  return null;
}
