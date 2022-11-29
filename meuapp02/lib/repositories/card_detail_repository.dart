import 'package:meuapp02/model/card_detail_model.dart';

const String loremIpsum1 =
    "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

const String loremIpsum2 =
    "No exemplo coloquei o modificador late. Não tem muito a ver com a pergunta, mas se você quiser, você pode ler mais sobre ele aqui (em inglês, e também sobre null-safety como um todo.)";

class CardDetailRepository {
  Future<CardDetailModel> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetailModel(
      id: 1,
      title: 'Meu Card',
      url: 'images/logo.png',
      text: loremIpsum1,
    );
  }
}
