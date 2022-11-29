import 'package:flutter/material.dart';
import 'package:meuapp02/shared/app_images.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 50,
        ),
        Image.asset(
          AppImages.user2,
          height: 50,
        ),
        Image.asset(
          AppImages.user3,
          height: 50,
        ),
        Image.asset(
          AppImages.user4,
          height: 50,
        ),
      ],
    );
  }
}
