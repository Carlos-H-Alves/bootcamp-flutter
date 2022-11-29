import 'package:flutter/material.dart';
import 'package:meuapp02/pages/dados_cadastrais.dart';
import 'package:meuapp02/pages/login_page.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  String loremIpsum =
      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text('Camera'),
                            leading: const Icon(Icons.camera),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text('Galeria'),
                            leading: const Icon(Icons.album),
                          ),
                        ],
                      );
                    });
              },
              child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.amber),
                  currentAccountPicture:
                      // CircleAvatar(
                      // backgroundColor: Colors.white,
                      // child:
                      Image.network(
                          'https://avatars.githubusercontent.com/u/22896953?v=4'),
                  // ),
                  accountName: const Text('Carlos Alves'),
                  accountEmail: const Text('teste@teste.com')),
            ),
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
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text('Dados cadastrais'),
                    ],
                  )),
            ),
            const Divider(),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            loremIpsum,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 16),
                          ));
                    });
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text('Termos de uso e privacidade'),
                    ],
                  )),
            ),
            const Divider(),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.engineering),
                      SizedBox(width: 5),
                      Text('Configurações'),
                    ],
                  )),
            ),
            const Divider(),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 12,
                      title: const Text('Meu app'),
                      content: const Text('Deseja realmente sair do app?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Não'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 5),
                      Text('Sair'),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
