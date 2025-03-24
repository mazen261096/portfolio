import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/auth_module/presentation/screens/login_screen/login_screen.dart';
import 'package:portfolio/auth_module/presentation/screens/register_screen/register_screen.dart';
import 'package:portfolio/portfolio_module/presentation/screens/home_screen.dart';
import 'package:portfolio/portfolio_module/presentation/screens/portfolio_screen.dart';
import '../../settings_module/presentation/screens/settings_screen.dart';

class Routes {
  static const String homeRoute = "/"; // تعديل المسار الرئيسي إلى "/home"
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String settingsRoute = "/settings";
}

final GoRouter router = GoRouter(
  routes: [
    // الصفحة الرئيسية
    GoRoute(
      path: Routes.homeRoute, // تغيير المسار من "/" إلى "/home"
      builder: (context, state) => const HomeScreen(),
    ),

    // صفحة تسجيل الدخول
    GoRoute(
      path: Routes.loginRoute,
      builder: (context, state) => const LoginScreen(),
    ),

    // صفحة التسجيل
    GoRoute(
      path: Routes.registerRoute,
      builder: (context, state) => const RegisterScreen(),
    ),

    // صفحة الإعدادات
    GoRoute(
      path: Routes.settingsRoute,
      builder: (context, state) => const SettingsScreen(),
    ),

    // عرض بورتفوليو المبرمج بناءً على اسم المستخدم
    GoRoute(
      path: '/:username',
      builder: (context, state) {
        final String? username = state.pathParameters['username'];

        // التحقق من صحة اليوزرنيم
        if (username == null || username.isEmpty) {
          return const NotFoundScreen();
        }

        return PortfolioScreen(userName: username);
      },
    ),
  ],

  // تحديد المسار الابتدائي (توجيه "/" إلى "/home")
  initialLocation: Routes.homeRoute,

  // التعامل مع أي رابط غير معروف
  errorPageBuilder: (context, state) => MaterialPage(
    child: NotFoundScreen(),
  ),
);

// شاشة الخطأ لصفحات غير موجودة
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الصفحة غير موجودة")),
      body: const Center(
        child: Text("هذه الصفحة غير متوفرة، تأكد من الرابط."),
      ),
    );
  }
}
