import 'package:calc_imc/constants/constants_widgets.dart';
import 'package:flutter/material.dart';

class FilhoCartaoPadrao extends StatelessWidget {
  // final Widget iconFilhoCartao;
  final IconData iconFilhoCartao;
  final String textFilhoCartao;
  const FilhoCartaoPadrao(
      {Key? key, required this.iconFilhoCartao, required this.textFilhoCartao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Icon(
            iconFilhoCartao,
            size: 70.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Expanded(
          flex: 1,
          child: Text(
            textFilhoCartao,
            style: kTextStyleDescricao,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
