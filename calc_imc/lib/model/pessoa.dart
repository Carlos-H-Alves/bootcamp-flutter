// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pessoa {
  String nome = "";
  double peso = 0.0;
  double altura = 0.0;
  Pessoa({
    required this.nome,
    required this.peso,
    required this.altura,
  });

  double calcImc(double peso, double altura) {
    return peso / (altura * altura);
  }

  String classificacao(double imc) {
    var imcResult = imc.round();
    // ignore: unused_local_variable
    var classificacao = "";

    if (imcResult < 16) {
      return classificacao = "Magreza grave";
    } else if (imcResult < 17) {
      return classificacao = "Magreza moderada";
    } else if (imcResult < 18.5) {
      return classificacao = "Magreza leve";
    } else if (imcResult < 25) {
      return classificacao = "Saudável";
    } else if (imcResult < 30) {
      return classificacao = "Sobrepeso";
    } else if (imcResult < 35) {
      return classificacao = "Obesidade Grau I";
    } else if (imcResult < 40) {
      return classificacao = "Obesidade Grau II";
    } else {
      return classificacao = "Obesidade Grau III";
    }
  }

  @override
  String toString() => 'Pessoa(nome: $nome, peso: $peso, altura: $altura)';
}
