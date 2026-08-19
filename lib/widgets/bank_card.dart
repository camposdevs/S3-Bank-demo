import 'package:flutter/material.dart';
import '../models/card_tier.dart';

/// Widget do cartão físico do S3 Bank: metal escovado por tier, chip EMV,
/// símbolo contactless, logo "S3 BANK" e bandeira.
class BankCard extends StatelessWidget {
  final CardTier tier;
  final String holderName;
  final String maskedNumber;

  const BankCard({
    super.key,
    required this.tier,
    this.holderName = 'RAFAEL OLIVEIRA',
    this.maskedNumber = '•••• •••• •••• 3876',
  });

  @override
  Widget build(BuildContext context) {
    final colors = tier.gradientColors;
    final fg = tier.foreground;

    return AspectRatio(
      aspectRatio: 1.586, // proporção real de cartão (85.6mm x 53.98mm)
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
            stops: const [0.0, 0.55, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.45),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Textura sutil de "metal escovado" (linhas diagonais claras).
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CustomPaint(
                  painter: _BrushedMetalPainter(),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardLogo(color: fg),
                const Spacer(),
                Row(
                  children: [
                    _ChipIcon(),
                    const SizedBox(width: 12),
                    _ContactlessIcon(color: fg),
                  ],
                ),
                const Spacer(),
                Text(
                  maskedNumber,
                  style: TextStyle(
                    color: fg,
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            holderName,
                            style: TextStyle(
                              color: fg,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            tier.label.toUpperCase(),
                            style: TextStyle(
                              color: fg.withOpacity(0.75),
                              fontSize: 9,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _CardNetworkMark(color: fg),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Logo "S3 BANK": "S3" em negrito + "BANK" em peso regular.
class _CardLogo extends StatelessWidget {
  final Color color;
  const _CardLogo({required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'S3',
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'BANK',
          style: TextStyle(
            color: color.withOpacity(0.9),
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

/// Chip EMV em gradiente prata/alumínio fosco.
class _ChipIcon extends StatelessWidget {
  const _ChipIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE8E8E8), Color(0xFF8E8E93)],
        ),
      ),
      child: CustomPaint(painter: _ChipLinesPainter()),
    );
  }
}

/// Desenha as linhas internas clássicas de um chip EMV.
class _ChipLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6E6E73)
      ..strokeWidth = 1;

    canvas.drawLine(Offset(size.width * 0.35, 0),
        Offset(size.width * 0.35, size.height), paint);
    canvas.drawLine(Offset(size.width * 0.65, 0),
        Offset(size.width * 0.65, size.height), paint);
    canvas.drawLine(Offset(0, size.height * 0.5),
        Offset(size.width * 0.35, size.height * 0.5), paint);
    canvas.drawLine(Offset(size.width * 0.65, size.height * 0.5),
        Offset(size.width, size.height * 0.5), paint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.35, size.height * 0.22,
            size.width * 0.3, size.height * 0.56),
        const Radius.circular(3),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Ícone de pagamento por aproximação (ondas contactless).
class _ContactlessIcon extends StatelessWidget {
  final Color color;
  const _ContactlessIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.78, // ~ -45°, deixa as ondas na diagonal certa
      child: Icon(Icons.wifi, color: color.withOpacity(0.85), size: 22),
    );
  }
}

/// Marca genérica de bandeira: dois círculos sobrepostos + texto,
/// no mesmo estilo tonal (prata/branco) das artes de referência.
class _CardNetworkMark extends StatelessWidget {
  final Color color;
  const _CardNetworkMark({required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 38,
          height: 24,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(0.85),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(0.55),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'mastercard',
          style: TextStyle(
            color: color.withOpacity(0.85),
            fontSize: 8,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}

/// Textura leve de metal escovado (linhas diagonais translúcidas).
class _BrushedMetalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..strokeWidth = 1;

    for (double x = -size.height; x < size.width; x += 6) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}