import 'package:flutter/material.dart';
import 'package:meuapp02/repositories/linguagem_repository.dart';
import 'package:meuapp02/repositories/nivel_repository.dart';

class DadosCadastrais extends StatefulWidget {
  final String texto;
  const DadosCadastrais({super.key, required this.texto});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeController = TextEditingController(text: "Carlos Alves");
  var dataController = TextEditingController(text: '');
  DateTime? dataNasc;
  var nivelRepository = NivelRepository();
  var linguagemRepository = LinguagemRepository();
  var niveis = [];
  var linguagens = [];
  var niveLSelecionado = "";
  var linguagensSelecionado = [];
  var salarioEscolhido = 0.0;
  var tempoExperiencia = 0;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLinguagem();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int qtd) {
    var itens = <DropdownMenuItem<int>>[];
    for (int i = 0; i <= qtd; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.texto.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nome",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Data Nascimento",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              readOnly: true,
              controller: dataController,
              onTap: () async {
                var data = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000, 01, 01),
                  firstDate: DateTime(1900, 01, 01),
                  lastDate: DateTime(2023, 01, 01),
                );
                if (data != null) {
                  dataController.text = data.toString();
                  dataNasc = data;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Nível de experiência",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: niveis
                  .map((nivel) => RadioListTile(
                      dense: true,
                      title: Text(nivel),
                      value: nivel,
                      selected: niveLSelecionado == nivel,
                      groupValue: niveLSelecionado,
                      onChanged: (value) {
                        setState(() {
                          niveLSelecionado = value;
                        });
                      }))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Linguagem preferida",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: linguagens
                  .map((ling) => CheckboxListTile(
                      dense: true,
                      title: Text(ling),
                      value: linguagensSelecionado.contains(ling),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            linguagensSelecionado.add(ling);
                          } else {
                            linguagensSelecionado.remove(ling);
                          }
                        });
                      }))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Tempo de experiência",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
                value: tempoExperiencia,
                isExpanded: true,
                items: returnItens(30),
                onChanged: ((value) {
                  setState(() {
                    tempoExperiencia = int.parse(value.toString());
                  });
                })),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Pretenção salarial R\$ ${salarioEscolhido.round().toString()}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
                min: 0,
                max: 8000,
                value: salarioEscolhido,
                onChanged: (double value) {
                  setState(() {
                    salarioEscolhido = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  if (nomeController.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O nome deve ser preenchido")));
                    return;
                  }
                  if (dataNasc == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data de nascimento inválida")));
                    return;
                  }

                  if (linguagensSelecionado.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("A linguagem deve ser selecionada")));
                    return;
                  }
                  debugPrint(nomeController.text);
                  debugPrint(dataNasc.toString());
                  debugPrint(niveLSelecionado);
                  debugPrint(linguagensSelecionado.toString());
                  debugPrint(tempoExperiencia.toString());
                  debugPrint(salarioEscolhido.toString());
                },
                child: const Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
