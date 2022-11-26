import 'package:calc_imc/constants/constants_widgets.dart';
import 'package:flutter/material.dart';

class BotaoInferior extends StatelessWidget {
  final String tituloBotao;
  final VoidCallback aoPressionar;

  const BotaoInferior(
      {Key? key, required this.tituloBotao, required this.aoPressionar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        color: kCorContainerInferior,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kAlturaContainerInferior,
        padding: const EdgeInsets.only(bottom: 5),
        child: Center(
          child: Text(
            tituloBotao,
            style: kTextStyleBotaoGrande,
          ),
        ),
      ),
    );
  }
}
