import 'package:calc_imc/constants/constants_widgets.dart';
import 'package:calc_imc/widgets/botao_inferior.dart';
import 'package:calc_imc/widgets/cartao_padrao.dart';
import 'package:flutter/material.dart';

class ResultadoImc extends StatelessWidget {
  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  const ResultadoImc(
      {super.key,
      required this.resultadoIMC,
      required this.resultadoTexto,
      required this.interpretacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CALCULADORA IMC')),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              child: Center(
            child: Text(
              'RESULTADO',
              style: kTextStyleTitulo,
            ),
          )),
          Expanded(
            flex: 5,
            child: CartaoPadrao(
              cor: kCorAtivoCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: kTextStyleResultado,
                  ),
                  Text(
                    resultadoIMC,
                    style: kTextStyleIMC,
                  ),
                  Text(
                    interpretacao,
                    textAlign: TextAlign.center,
                    style: kTextStyleCorpo,
                  ),
                ],
              ),
            ),
          ),
          BotaoInferior(
            tituloBotao: 'RECALCULAR',
            aoPressionar: (() {
              Navigator.pop(context);
            }),
          )
        ],
      ),
    );
  }
}
