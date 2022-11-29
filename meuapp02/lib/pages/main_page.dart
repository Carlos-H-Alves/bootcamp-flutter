import 'package:flutter/material.dart';
import 'package:meuapp02/pages/pages_views/card_page.dart';
import 'package:meuapp02/pages/pages_views/pagina3.dart';
import 'package:meuapp02/pages/pages_views/tarefa_page.dart';
import 'package:meuapp02/shared/custom_drawer.dart';

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
        drawer: CustomDrawer(),
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
                  // Pagina1(),
                  CardPage(),
                  // Pagina2(),
                  TarefaPage(),
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
