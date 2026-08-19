import 'package:flutter/material.dart';
import '../theme.dart';

class PixTransferScreen extends StatefulWidget {
  const PixTransferScreen({super.key});

  @override
  State<PixTransferScreen> createState() => _PixTransferScreenState();
}

class _PixTransferScreenState extends State<PixTransferScreen> {
  final _valorController = TextEditingController(text: 'R\$ 0,00');
  final _descricaoController = TextEditingController();
  String? _contatoSelecionado;

  @override
  void dispose() {
    _valorController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

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
                    const Text(
                      'Para quem você quer enviar?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Chave, contato ou agência e conta',
                        suffixIcon:
                            const Icon(Icons.search, color: Colors.white38),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Escolha um contato',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                        Text('Ver todos',
                            style: TextStyle(
                                color: AppColors.purpleLight, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 78,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _ContactChip('RS', 'Rafael Silva', _contatoSelecionado,
                              (v) => setState(() => _contatoSelecionado = v)),
                          _ContactChip('AM', 'Ana Maria', _contatoSelecionado,
                              (v) => setState(() => _contatoSelecionado = v)),
                          _ContactChip('JF', 'João Ferreira',
                              _contatoSelecionado,
                              (v) => setState(() => _contatoSelecionado = v)),
                          _ContactChip('NL', 'Nayara Lima',
                              _contatoSelecionado,
                              (v) => setState(() => _contatoSelecionado = v)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Qual o valor?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _valorController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    const Text('Descrição (opcional)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _descricaoController,
                      maxLength: 60,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Digite uma descrição',
                        counterStyle: TextStyle(color: Colors.white38),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('De qual conta?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.purpleLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 20),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Conta Digital',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13)),
                                Text('Ag 1324 · Conta 3876-4',
                                    style: TextStyle(
                                        color: Colors.white38, fontSize: 11)),
                              ],
                            ),
                          ),
                          const Icon(Icons.check_circle,
                              color: AppColors.purpleLight, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/sucesso'),
                  child: const Text('Continuar'),
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
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 22),
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
          const SizedBox(height: 14),
          const Text(
            'Área Pix',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          const Text(
            'Transferências e pagamentos de forma\neficiente a qualquer hora.',
            style:
                TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 18),
          const _StepIndicator(),
        ],
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator();

  @override
  Widget build(BuildContext context) {
    final steps = ['Informações', 'Confirmação', 'Conclusão'];
    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          return Expanded(
            child: Container(
              height: 2,
              color: Colors.white.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(horizontal: 4),
            ),
          );
        }
        final stepIndex = i ~/ 2;
        final active = stepIndex == 0;
        return Column(
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? Colors.white : Colors.white.withOpacity(0.2),
              ),
              child: Text(
                '${stepIndex + 1}',
                style: TextStyle(
                  color: active ? AppColors.blueDark : Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              steps[stepIndex],
              style: TextStyle(
                color: active ? Colors.white : Colors.white54,
                fontSize: 9,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ContactChip extends StatelessWidget {
  final String initials;
  final String name;
  final String? selected;
  final ValueChanged<String> onSelect;

  const _ContactChip(this.initials, this.name, this.selected, this.onSelect);

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == initials;
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: GestureDetector(
        onTap: () => onSelect(initials),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor:
                  isSelected ? AppColors.purpleLight : AppColors.surface,
              child: Text(
                initials,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 56,
              child: Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white60, fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}