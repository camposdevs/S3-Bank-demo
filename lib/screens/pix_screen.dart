import 'package:flutter/material.dart';
import '../theme.dart';

class PixScreen extends StatelessWidget {
  const PixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _PixHeader(onBack: () => Navigator.pop(context)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SectionTitle('Enviar'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        _PixOption(Icons.qr_code_scanner, 'Pagar com\nQr Code',
                            () => Navigator.pushNamed(context, '/pix/metodo')),
                        _PixOption(Icons.copy_outlined, 'Pix Copia\ne Cola',
                            () => Navigator.pushNamed(context, '/pix/transferir')),
                        _PixOption(Icons.attach_money, 'Pix com\nChave/Manual',
                            () => Navigator.pushNamed(context, '/pix/transferir')),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        _PixOption(Icons.arrow_upward, 'Sacar', () {}),
                        _PixOption(Icons.arrow_downward, 'Depositar', () {}),
                        _PixOption(
                            Icons.request_page_outlined, 'Cobrar', () {}),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const _SectionTitle('Outros'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        _PixOption(
                            Icons.vpn_key_outlined, 'Minhas\nChaves', () {}),
                        _PixOption(Icons.autorenew, 'Pix\nAutomático', () {}),
                        _PixOption(Icons.add_circle_outline,
                            'Cadastrar\nChave Pix', () {}),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        _PixOption(
                            Icons.bookmark_border, 'Chaves\nSalvas', () {}),
                        const Spacer(flex: 2),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Saldo disponível',
                      style: TextStyle(color: Colors.white38, fontSize: 12)),
                  Text('R\$ 867.000,00',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PixHeader extends StatelessWidget {
  final VoidCallback onBack;
  const _PixHeader({required this.onBack});

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
          const Text(
            'Transferências e pagamentos de forma\neficiente a qualquer hora.',
            style:
                TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _PixOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PixOption(this.icon, this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}