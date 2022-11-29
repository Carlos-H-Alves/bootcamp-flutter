import 'package:flutter/material.dart';
import 'package:meuapp02/model/tarefa_model.dart';
import 'package:meuapp02/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var descricaoController = TextEditingController();
  var _tarefas = const <TarefaModel>[];
  var apenasNaoConcluidas = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.listarTarefas();
    if (apenasNaoConcluidas) {
      _tarefas = await tarefaRepository.listarNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listarTarefas();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('Adicionar Tarefa'),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () async {
                        debugPrint(descricaoController.text);
                        await tarefaRepository.adicionar(
                            TarefaModel(descricaoController.text, false));
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                );
              }));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text('Apenas não concluidas'),
                  Switch(
                      value: apenasNaoConcluidas,
                      onChanged: (bool value) {
                        apenasNaoConcluidas = value;
                        obterTarefas();
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: ((context, index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                        onDismissed: (direction) async {
                          await tarefaRepository.remover(tarefa.id);
                          obterTarefas();
                        },
                        key: Key(tarefa.id),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                            onChanged: (bool value) async {
                              await tarefaRepository.alterar(tarefa.id, value);
                              obterTarefas();
                            },
                            value: tarefa.concluido,
                          ),
                        ));
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
