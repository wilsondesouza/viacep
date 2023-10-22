import 'package:flutter/material.dart';

import 'pages/consulta_cep.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: "Consulta CEP",
      color: const Color.fromARGB(255, 31, 29, 29),
      home: const ConsultaCEP(),
      initialRoute: '/',
    );
  }
}
