import 'package:flutter/material.dart';
import 'package:meuapp02/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: 'email@teste.com');
  var senhaController = TextEditingController(text: '123');
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: Image.network(
                          "https://hermes.dio.me/assets/diome/logo.png",
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Já tem cadastro?",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          // flex: 2,
                          child: TextField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.purple),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          // flex: 2,
                          child: TextField(
                            controller: senhaController,
                            obscureText: isObscureText,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 0),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              hintText: "Senha",
                              hintStyle: const TextStyle(color: Colors.purple),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.purple,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (emailController.text.trim() ==
                                  'email@teste.com' &&
                              senhaController.text.trim() == '123') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ));
                            debugPrint('Login efetuado com sucesso');
                          } else {
                            debugPrint('Erro ao efetuar login');
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Erro ao efetuar Login')));
                          }
                          debugPrint(emailController.text);
                          debugPrint(senhaController.text);
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                        ),
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
