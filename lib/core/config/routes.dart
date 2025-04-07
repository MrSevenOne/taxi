import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taxi/presentation/screens/auth/signup_screen.dart';
import 'package:taxi/presentation/screens/home/yonalish_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String yonalish = '/yonalish';
  static const String signup = '/signup';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return PageTransition(
          type: PageTransitionType.fade,
          child: SplashScreen(),
        );
      case home:
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeScreen(),
        );
      case signup:
        return PageTransition(
          type: PageTransitionType.fade,
          child: SignupScreen(),
        );
        case yonalish:
        return PageTransition(
          type: PageTransitionType.fade,
          child: YonalishScreen(),
        );
      default:
        return null;
    }
  }
}
