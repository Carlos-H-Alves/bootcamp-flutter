// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImcModel {
  int altura = 0;
  int peso = 0;
  // double resultado = 0.0;
  String resultado = "";
  String resultadoText = "";

  ImcModel({
    required this.altura,
    required this.peso,
    required this.resultado,
    required this.resultadoText,
  });

  @override
  String toString() =>
      'ImcModel(altura: $altura, peso: $peso, resultado: $resultado)';
}
