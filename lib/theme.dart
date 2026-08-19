import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Paleta de cores central do app S3 Bank.
/// Extraída do cartão: roxo -> azul médio -> azul escuro (135deg).
class AppColors {
  static const Color purpleLight = Color(0xFF6F42C1); // roxo topo/luz
  static const Color bluePrimary = Color(0xFF3355D3); // azul central
  static const Color blueDark = Color(0xFF1E2B88); // azul escuro/sombra
  static const Color background = Color(0xFF14162B); // fundo geral do app
  static const Color surface = Color(0xFF23264A); // cards / superfícies
  static const Color surfaceLight = Color(0xFF2D3160); // inputs / botões secundários
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B3D6);
  static const Color success = Color(0xFF2ECC71);
  static const Color chipSilverStart = Color(0xFFC0C0C0);
  static const Color chipSilverEnd = Color(0xFF8E8E93);

  /// Gradiente principal do cartão/app: 135deg roxo -> azul -> azul escuro.
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [purpleLight, bluePrimary, blueDark],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient cardHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [purpleLight, bluePrimary, blueDark],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient chipGradient = LinearGradient(
    colors: [chipSilverStart, chipSilverEnd],
  );
}

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.bluePrimary,
        secondary: AppColors.purpleLight,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purpleLight,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: AppColors.textSecondary),
      ),
    );
  }
}