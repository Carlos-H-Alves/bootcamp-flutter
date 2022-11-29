import 'package:calc_imc2/constants/constants_widgets.dart';
import 'package:flutter/material.dart';

class BotaoArredondado extends StatelessWidget {
  final IconData icone;
  final VoidCallback acaoButton;

  const BotaoArredondado(
      {super.key, required this.icone, required this.acaoButton});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: acaoButton,
      shape: const CircleBorder(),
      fillColor: kCorInativoCartaoPadrao,
      child: Icon(icone),
    );
  }
}
