import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jotarbs_finance/helpers/conta.helper.dart';
import 'package:jotarbs_finance/model/conta.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _descricaoController = new TextEditingController();
  final _saldoController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _descricaoController,
            decoration: InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          TextField(
            controller: _saldoController,
            decoration: InputDecoration(
              labelText: 'Saldo',
              labelStyle: TextStyle(
                color: Colors.blue,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          RaisedButton(
            child: Text(
              'Salvar',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              addConta();
            },
          )
        ],
      )),
    );
  }

  void addConta() {
    Conta conta =
        new Conta(_descricaoController.text, num.parse(_saldoController.text));
    ContaHelper contaHelper = new ContaHelper();
    contaHelper.addConta(conta);
  }
}
