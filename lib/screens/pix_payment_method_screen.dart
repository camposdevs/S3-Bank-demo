import 'package:flutter/material.dart';
import '../theme.dart';

class PixPaymentMethodScreen extends StatelessWidget {
  const PixPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _Header(onBack: () => Navigator.pop(context)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _MethodCard(
                          icon: Icons.qr_code_2,
                          label: 'Pix',
                          highlighted: true,
                          onTap: () =>
                              Navigator.pushNamed(context, '/pix/transferir'),
                        ),
                        const SizedBox(width: 14),
                        _MethodCard(
                          icon: Icons.barcode_reader,
                          label: 'Pagar com\ncódigo de barras',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _MethodCard(
                          icon: Icons.qr_code_scanner,
                          label: 'Ler QR Code',
                          onTap: () {},
                        ),
                        const SizedBox(width: 14),
                        _MethodCard(
                          icon: Icons.receipt_long_outlined,
                          label: 'Pagar\num boleto',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: const [
                        Expanded(
                          child: _LinkRow(
                              icon: Icons.vpn_key_outlined,
                              label: 'Minhas Chaves'),
                        ),
                        Expanded(
                          child: _LinkRow(
                              icon: Icons.history, label: 'Meus pagamentos'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Meus contatos frequentes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _ContactAvatar(
                          initials: 'RS',
                          name: 'Rafael Silva',
                          onTap: () =>
                              Navigator.pushNamed(context, '/pix/transferir'),
                        ),
                        _ContactAvatar(
                          initials: 'AM',
                          name: 'Ana Maria',
                          onTap: () =>
                              Navigator.pushNamed(context, '/pix/transferir'),
                        ),
                        _ContactAvatar(
                          initials: 'JF',
                          name: 'João Ferreira',
                          onTap: () =>
                              Navigator.pushNamed(context, '/pix/transferir'),
                        ),
                        _ContactAvatar(
                          initials: 'Ver\ntodos',
                          name: '',
                          isMuted: true,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onBack;
  const _Header({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        gradient: AppColors.cardHeaderGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 18),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Área Pix',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          RichText(
            text: const TextSpan(
              style:
                  TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
              children: [
                TextSpan(
                    text:
                        'Transferências e pagamentos de forma\neficiente a qualquer hora, como você deseja\nfazer o '),
                TextSpan(
                  text: 'pagamento?',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool highlighted;
  final VoidCallback onTap;

  const _MethodCard({
    required this.icon,
    required this.label,
    required this.onTap,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: highlighted ? AppColors.cardHeaderGradient : null,
            color: highlighted ? null : AppColors.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.white, size: 26),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _LinkRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _ContactAvatar extends StatelessWidget {
  final String initials;
  final String name;
  final bool isMuted;
  final VoidCallback onTap;

  const _ContactAvatar({
    required this.initials,
    required this.name,
    required this.onTap,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor:
                  isMuted ? AppColors.surface : AppColors.purpleLight,
              child: Text(
                initials,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isMuted ? Colors.white54 : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isMuted ? 10 : 13,
                ),
              ),
            ),
            const SizedBox(height: 6),
            if (name.isNotEmpty)
              Text(
                name,
                style: const TextStyle(color: Colors.white70, fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}