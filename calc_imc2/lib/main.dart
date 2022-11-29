import 'package:calc_imc2/constants/constants_widgets.dart';
import 'package:calc_imc2/pages/initial_imc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF616161),
        // scaffoldBackgroundColor: const Color(0xFF616161),
        scaffoldBackgroundColor: kCorFundoPadrao,
      ),
      // home: const CalcImcPage(),
      home: const InitialImc(),
    );
  }
}
//Agradecimentos ao canal 
// https://www.youtube.com/watch?v=_osdIv_HVGM&list=PLqdwHeoSjEN-9aGd-RxaS_2cyD_AKT0c_&index=78
