import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TelaInicial> {
  String _preco = '';
  Future<void> _recuperarPreco() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _preco = retorno['BRL']['buy'].toString();
    });

    print('Resultado ' + retorno['BRL']['buy'].toString());
  }

  // String _preco = '0';
  // void _recuperarPreco() async {
  //   String url = 'https://blockchain.info/ticker';
  //   http.Response response = await http.get(url);
  //   Map<String, dynamic> retorno = json.decode(response.body);

  //   setState(() {
  //     _preco = retorno.['BRL']['buy'].toString();
  //   });

  //   print('Resultado ' + retorno.['BRL']['buy'].toString());

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bitcoin'),
      //   centerTitle: true,
      // ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('imagens/bitcoin.png'),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              Text(
                'R\$ ' + _preco,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              OutlinedButton(
                onPressed: _recuperarPreco,
                child: Text(
                  'Atualizar',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
