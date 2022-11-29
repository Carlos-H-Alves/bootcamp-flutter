import 'package:flutter/material.dart';

class TarefaModel {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;
  // String _descricao;
  // bool _concluido;
  TarefaModel(
    this._descricao,
    this._concluido,
  );

  // String getId() {
  //   return _id;
  // }
  String get id => _id;
  // ignore: unnecessary_getters_setters
  String get descricao => _descricao;
  // ignore: unnecessary_getters_setters
  bool get concluido => _concluido;

  // String getDescricao() {
  //   return _descricao;
  // }

  // bool getConcluido() {
  //   return _concluido;
  // }

  set descricao(String descricao) {
    _descricao = descricao;
  }

  set concluido(bool concluido) {
    _concluido = concluido;
  }
}
