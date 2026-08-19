import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pix_screen.dart';
import 'screens/pix_payment_method_screen.dart';
import 'screens/pix_transfer_screen.dart';
import 'screens/success_screen.dart';

void main() {
  runApp(const S3BankApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}

class S3BankApp extends StatelessWidget {
  const S3BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S3 Bank',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
        '/pix': (_) => const PixScreen(),
        '/pix/metodo': (_) => const PixPaymentMethodScreen(),
        '/pix/transferir': (_) => const PixTransferScreen(),
        '/sucesso': (_) => const SuccessScreen(),
      },
    );
  }
}