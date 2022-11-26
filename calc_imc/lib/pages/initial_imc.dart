import 'package:calc_imc/constants/constants_widgets.dart';
import 'package:calc_imc/pages/resultado_imc.dart';
import 'package:calc_imc/service/calcularo_imc_service.dart';
import 'package:calc_imc/widgets/botao_arredondado.dart';
import 'package:calc_imc/widgets/botao_inferior.dart';
import 'package:calc_imc/widgets/cartao_padrao.dart';
import 'package:calc_imc/widgets/filho_cartao_padrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Sexo { masculino, feminino }

class InitialImc extends StatefulWidget {
  const InitialImc({super.key});

  @override
  State<InitialImc> createState() => _InitialImcState();
}

class _InitialImcState extends State<InitialImc> {
  var nomeController = TextEditingController(text: '');

  Sexo? sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CALCULADORA IMC')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () => setState(() {
                      sexoSelecionado = Sexo.masculino;
                    }),
                    cor: sexoSelecionado == Sexo.masculino
                        ? kCorAtivoCartaoPadrao
                        : kCorInativoCartaoPadrao,
                    filhoCartao: const FilhoCartaoPadrao(
                      iconFilhoCartao: FontAwesomeIcons.mars,
                      textFilhoCartao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () => setState(() {
                      sexoSelecionado = Sexo.feminino;
                    }),
                    cor: sexoSelecionado == Sexo.feminino
                        ? kCorAtivoCartaoPadrao
                        : kCorInativoCartaoPadrao,
                    filhoCartao: const FilhoCartaoPadrao(
                      iconFilhoCartao: FontAwesomeIcons.venus,
                      textFilhoCartao: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
              cor: kCorAtivoCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ALTURA',
                    style: kTextStyleDescricao,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: kTextStyleNumero,
                      ),
                      const Text(
                        'cm',
                        style: kTextStyleDescricao,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Slider(
                        activeColor: kCorContainerInferior,
                        inactiveColor: kCorFundoPadrao,
                        value: altura.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: ((value) {
                          setState(() {
                            altura = value.round();
                          });
                        })),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivoCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PESO',
                          style: kTextStyleDescricao,
                        ),
                        Text(
                          peso.toString(),
                          style: kTextStyleNumero,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BotaoArredondado(
                                  icone: FontAwesomeIcons.minus,
                                  acaoButton: () {
                                    setState(() {
                                      peso--;
                                    });
                                  },
                                ),
                                BotaoArredondado(
                                  icone: FontAwesomeIcons.plus,
                                  acaoButton: () {
                                    setState(() {
                                      peso++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivoCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IDADE',
                          style: kTextStyleDescricao,
                        ),
                        Text(
                          idade.toString(),
                          style: kTextStyleNumero,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BotaoArredondado(
                                  icone: FontAwesomeIcons.minus,
                                  acaoButton: () {
                                    setState(() {
                                      idade--;
                                    });
                                  },
                                ),
                                BotaoArredondado(
                                  icone: FontAwesomeIcons.plus,
                                  acaoButton: () {
                                    setState(() {
                                      idade++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {
              CalculadoraImcService calc =
                  CalculadoraImcService(altura: altura, peso: peso);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => ResultadoImc(
                          resultadoIMC: calc.calcularIMC(),
                          resultadoTexto: calc.obterResultado(),
                          interpretacao: calc.obterInterpretacao(),
                        ))),
              );
            },
          ),
        ],
      ),
    );
  }
}
