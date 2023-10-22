import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({Key? key}) : super(key: key);

  @override
  ConsultaCEPState createState() => ConsultaCEPState();
}

class ConsultaCEPState extends State<ConsultaCEP> {
  final TextEditingController cepController = TextEditingController();
  String result = '';

  Future<void> getCEPInfo(String cep) async {
    final viaCepUrl = 'https://viacep.com.br/ws/$cep/json/';

    final response = await http.get(Uri.parse(viaCepUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        result = '''
        CEP: ${data['cep']}
        Logradouro: ${data['logradouro']}
        Bairro: ${data['bairro']}
        Cidade: ${data['localidade']}
        Estado: ${data['uf']}
        ''';
      });
    } else {
      setState(() {
        result = 'CEP não encontrado.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: cepController,
              decoration: const InputDecoration(labelText: 'Digite o CEP'),
            ),
            ElevatedButton(
              onPressed: () {
                getCEPInfo(cepController.text);
              },
              child: const Text('Consultar CEP'),
            ),
            const SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
