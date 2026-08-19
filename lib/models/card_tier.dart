import 'package:flutter/material.dart';

/// Os 4 tiers do sistema de progressão CDI do S3 Bank.
enum CardTier { bronze, prata, ouro, diamante }

extension CardTierData on CardTier {
  String get label {
    switch (this) {
      case CardTier.bronze:
        return 'Bronze';
      case CardTier.prata:
        return 'Prata';
      case CardTier.ouro:
        return 'Ouro';
      case CardTier.diamante:
        return 'Diamante';
    }
  }

  /// Gradiente "metal escovado" de cada cartão, extraído das artes de
  /// referência de cada tier.
  List<Color> get gradientColors {
    switch (this) {
      case CardTier.bronze:
        return const [
          Color(0xFFF06AA6), // rosa claro (luz)
          Color(0xFFC2185B), // magenta médio
          Color(0xFF7A0D3D), // magenta escuro (sombra)
        ];
      case CardTier.prata:
        return const [
          Color(0xFFEDEDED), // prata claro (luz)
          Color(0xFFB8B9BD), // prata médio
          Color(0xFF6E6F73), // prata escuro (sombra)
        ];
      case CardTier.ouro:
        return const [
          Color(0xFFE9D6A8), // dourado claro (luz)
          Color(0xFFC9A227), // dourado médio
          Color(0xFF8A6A1E), // dourado escuro (sombra)
        ];
      case CardTier.diamante:
        return const [
          Color(0xFF6F42C1), // roxo topo/luz
          Color(0xFF3355D3), // azul central
          Color(0xFF1E2B88), // azul escuro/sombra
        ];
    }
  }

  /// Cor do texto/ícones sobre o cartão (todos os tiers usam branco).
  Color get foreground => Colors.white;
}