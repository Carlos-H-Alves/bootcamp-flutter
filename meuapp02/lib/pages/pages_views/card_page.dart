import 'package:flutter/material.dart';
import 'package:meuapp02/model/card_detail_model.dart';
import 'package:meuapp02/pages/pages_views/card_detail.dart';
import 'package:meuapp02/repositories/card_detail_repository.dart';

const String loremIpsum2 =
    "No exemplo coloquei o modificador late. Não tem muito a ver com a pergunta, mas se você quiser, você pode ler mais sobre ele aqui (em inglês, e também sobre null-safety como um todo.)";

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final String loremIpsum =
      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  // var cardDetailModel = CardDetailModel(
  //   id: 1,
  //   title: 'Meu Card',
  //   url: 'images/logo.png',
  //   text: loremIpsum2,
  // );
  CardDetailModel? cardDetailModel;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    cardDetailModel = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetailModel == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CardDetail(cardDetailModel: cardDetailModel!),
                        ));
                  },
                  child: Hero(
                    tag: cardDetailModel!.id,
                    child: Card(
                      elevation: 16,
                      shadowColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  // 'images/logo.png',
                                  cardDetailModel!.url,
                                  height: 20,
                                ),
                                Text(
                                  cardDetailModel!.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              cardDetailModel!.text,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Ler mais'))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
