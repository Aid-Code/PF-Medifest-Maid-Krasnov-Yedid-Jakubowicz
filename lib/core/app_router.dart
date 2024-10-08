import 'package:go_router/go_router.dart';
import 'package:myapp/screen/eligerol_screen.dart';
import 'package:myapp/screen/formulariousuario_screen.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/screen/login_screen.dart';
import 'package:myapp/screen/registro_screen.dart';
import 'package:myapp/screen/registrodoctor_screen.dart';
import 'package:myapp/entities/user.dart'; // Importa la clase User

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
      builder: (context, state) {
        final user = state.extra as User?; // Pasamos el objeto User
        return HomeScreen(user: user);
      },
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
      name: FormularioScreen.name,
      path: '/formulariousuario',
      builder: (context, state) => FormularioScreen(),
    ),
    GoRoute(
      name: RegisterDocScreen.name,
      path: '/registerDoc',
      builder: (context, state) => RegisterDocScreen(),
    ),
  ],
);
