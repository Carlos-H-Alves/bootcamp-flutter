import 'package:flutter/material.dart';
import 'package:meuapp02/model/card_detail_model.dart';

class CardDetail extends StatelessWidget {
  final CardDetailModel cardDetailModel;
  const CardDetail({super.key, required this.cardDetailModel});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetailModel.id,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                Row(
                  children: [
                    Image.asset(
                      cardDetailModel.url,
                      height: 100,
                    ),
                  ],
                ),
                Text(
                  cardDetailModel.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    cardDetailModel.text,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
