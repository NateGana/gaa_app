import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GAAApp());
}

class GAAApp extends StatelessWidget {
  const GAAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G.A.A',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.login,
      // Named routes for the three required screens.
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignUpScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
