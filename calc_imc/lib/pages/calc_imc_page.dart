import 'package:calc_imc/model/pessoa.dart';
import 'package:flutter/material.dart';

class CalcImcPage extends StatefulWidget {
  const CalcImcPage({super.key});

  @override
  State<CalcImcPage> createState() => _CalcImcPageState();
}

class _CalcImcPageState extends State<CalcImcPage> {
  var nomeController = TextEditingController(text: '');
  // var pesoController = TextEditingController(text: '');
  var alturaController = TextEditingController(text: '');
  var resultado = 0.0;
  var nome = "";
  var classificacao = "";
  var peso = 0.0;
  var altura = 0.0;
  Pessoa? pessoa;
  @override
  void initState() {
    setState(() {
      pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora IMC")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Nome",
              // style: TextStyle(color: Colors.blueGrey, fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Peso",
              // style: TextStyle(color: Colors.blueGrey, fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            // TextField(
            //   controller: pesoController,
            // ),
            Slider(
                min: 0,
                max: 700,
                value: peso,
                onChanged: (double value) {
                  setState(() {
                    peso = value;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Altura",
              // style: TextStyle(color: Colors.blueGrey, fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: alturaController,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    if (nomeController.text.trim().length < 3) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("O nome deve ser preenchido")));
                      return;
                    }

                    if (peso <= 0.0) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("O peso deve ser preenchido")));
                      return;
                    }
                    if (double.parse(alturaController.text) <= 0.0) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("A altura deve ser preenchido")));
                      return;
                    }
                    setState(() {
                      nome = nomeController.text;
                      // peso = double.parse(pesoController.text);
                      altura = double.parse(alturaController.text);

                      pessoa = Pessoa(nome: nome, peso: peso, altura: altura);

                      resultado = pessoa!.calcImc(peso, altura);
                      classificacao = pessoa!.classificacao(resultado);
                    });

                    debugPrint(nome);
                    debugPrint(peso.toString());
                    debugPrint(altura.toString());
                    debugPrint(resultado.round().toString());
                    debugPrint(classificacao.toString());
                  },
                  child: const Text('Salvar')),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Column(
                children: [
                  // const Text('Resultado: '),
                  // Text(resultado.toString()),
                  // Text(classificacao.toString()),
                  // Text(nomeController.text.toString()),
                  // Text(peso.toString()),
                  // Text(altura.toString()),
                  // Text(resultado.toString()),
                  Text(
                    pessoa.toString(),
                  ),

                  const Text('Resultado: '),
                  Text(resultado.toString()),
                  Text(classificacao.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
