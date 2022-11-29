import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  final Color cor;
  final Widget? filhoCartao;
  final VoidCallback? aoPressionar;

  const CartaoPadrao(
      {super.key, required this.cor, this.filhoCartao, this.aoPressionar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: filhoCartao,
      ),
    );
  }
}
