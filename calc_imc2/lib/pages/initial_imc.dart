import 'package:calc_imc2/constants/constants_widgets.dart';
import 'package:calc_imc2/model/imc_model.dart';
import 'package:calc_imc2/repositories/imc_repository.dart';
import 'package:calc_imc2/service/calcularo_imc_service.dart';
import 'package:calc_imc2/widgets/botao_arredondado.dart';
import 'package:calc_imc2/widgets/botao_inferior.dart';
import 'package:calc_imc2/widgets/cartao_padrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

enum Sexo { masculino, feminino }

class InitialImc extends StatefulWidget {
  const InitialImc({super.key});

  @override
  State<InitialImc> createState() => _InitialImcState();
}

class _InitialImcState extends State<InitialImc> {
  var nomeController = TextEditingController(text: '');
  var now = DateTime.now();
  final format = DateFormat('dd/MM/yyyy HH:mm');

  Sexo? sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 18;
  var listaIMc = <ImcModel>[];
  late ImcModel imcModel;
  var imcRepository = ImcRepository();

  @override
  void initState() {
    super.initState();
    obterIMCs();
  }

  void obterIMCs() {
    listaIMc = imcRepository.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CALCULADORA IMC')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: listaIMc.isNotEmpty,
            replacement: const Expanded(
              child: CartaoPadrao(
                cor: kCorAtivoCartaoPadrao,
                filhoCartao: Center(
                    child: Text(
                  'Calcule seu IMC',
                  style: kTextStyleIMC,
                )),
              ),
            ),
            child: SizedBox(
              height: 210.0,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listaIMc.length,
                itemBuilder: (BuildContext context, int index) => CartaoPadrao(
                  cor: kCorAtivoCartaoPadrao,
                  filhoCartao: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '${index + 1}º RESULTADO',
                          style: kResultado2,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Data: ${format.format(now)}',
                          style: kResultado3,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Altura: ${listaIMc[index].altura} cm',
                          style: kResultado3,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Peso: ${listaIMc[index].peso} kg',
                          style: kResultado3,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'IMC: ${listaIMc[index].resultado.toString()}',
                          style: kResultado2,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          listaIMc[index].resultadoText.toString(),
                          style: kResultado1,
                        ),
                      ],
                    ),
                  ),
                ),
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
              var imc = ImcModel(
                altura: altura,
                peso: peso,
                resultado: calc.resultadoIMC(peso, altura).toStringAsFixed(1),
                resultadoText: calc.obterResultado(peso, altura),
              );
              imcRepository.adicionar(imc);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
