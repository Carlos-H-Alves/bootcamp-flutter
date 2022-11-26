import 'dart:math';

class CalculadoraImcService {
  final int altura;
  final int peso;
  late double _imcResult;
  CalculadoraImcService({
    required this.altura,
    required this.peso,
  });

  String calcularIMC() {
    _imcResult = peso / pow(altura / 100, 2);
    return _imcResult.toStringAsFixed(1);
  }

  String obterResultado() {
    if (_imcResult < 16) {
      return "Magreza grave";
    } else if (_imcResult < 17) {
      return "Magreza moderada";
    } else if (_imcResult < 18.5) {
      return "Magreza leve";
    } else if (_imcResult < 25) {
      return "Saudável";
    } else if (_imcResult < 30) {
      return "Sobrepeso";
    } else if (_imcResult < 35) {
      return "Obesidade Grau I";
    } else if (_imcResult < 40) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Grau III";
    }
  }

  String obterInterpretacao() {
    if (_imcResult < 16) {
      return "Você precisa procurar um nutricionista para verificar seu peso.";
    } else if (_imcResult < 17) {
      return "Atenção! seu peso precisa ser avaliado por um profissional.";
    } else if (_imcResult < 18.5) {
      return "Atenção! Peso começando a compremeter a sua saúde.";
    } else if (_imcResult < 25) {
      return "Parabéns! Continue assim.";
    } else if (_imcResult < 30) {
      return "Atenção! Começando a entrar no sobrepeso.";
    } else if (_imcResult < 35) {
      return "Atenção! A obesidade pode trazer outros fatores prejudiciais a sua saúde.";
    } else if (_imcResult < 40) {
      return "Atenção! Procure um médico de sua confiança para avaliação.";
    } else {
      return "Atenção! Procure um médico de sua confiança para avaliação com urgência.";
    }
  }
}
