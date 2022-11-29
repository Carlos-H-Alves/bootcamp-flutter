import 'package:flutter/material.dart';
import 'package:meuapp02/shared/app_images.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          AppImages.people1,
        ),
        Image.asset(
          AppImages.people2,
        ),
        Image.asset(
          AppImages.people3,
        ),
        Image.asset(
          AppImages.user1,
        ),
        Image.asset(
          AppImages.user2,
        ),
        Image.asset(
          AppImages.user3,
        ),
      ],
    );
  }
}
