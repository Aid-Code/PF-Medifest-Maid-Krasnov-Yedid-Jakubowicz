

import 'package:go_router/go_router.dart';
import 'package:myapp/screen/eligerol_screen.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/screen/login_screen.dart';
import 'package:myapp/screen/registro_screen.dart';
import 'package:myapp/screen/registrodoctor_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: '/home',
      builder: (context, state) => HomeScreen(userName: state.extra as String),
    ),
    GoRoute(
      name: EligeRol.name,
      path: '/eligerol',
      builder: (context, state) => EligeRol(),
    ),
    GoRoute(
      name: RegisterScreen.name,
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      name: RegisterDocScreen.name,
      path: '/registerDoc',
      builder: (context, state) => RegisterDocScreen(),
    ),
  ],
);
