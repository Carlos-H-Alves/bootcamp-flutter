import 'package:flutter/material.dart';
import 'package:meuapp02/pages/dados_cadastrais.dart';
import 'package:meuapp02/pages/pages_views/pagina1.dart';
import 'package:meuapp02/pages/pages_views/pagina2.dart';
import 'package:meuapp02/pages/pages_views/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastrais(
                                  texto: 'Meus Dados',
                                )));
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text('Dados cadastrais')),
                ),
                const Divider(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text('Termos de uso e privacidade')),
                ),
                const Divider(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text('Configurações')),
                ),
                const Divider(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: ((value) {
                  setState(() {
                    paginaAtual = value;
                  });
                }),
                children: const [
                  Pagina1(),
                  Pagina2(),
                  Pagina3(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: ((value) => pageController.jumpToPage(value)),
              currentIndex: paginaAtual,
              items: const [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Home", icon: Icon(Icons.engineering)),
                BottomNavigationBarItem(
                    label: "Home", icon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
