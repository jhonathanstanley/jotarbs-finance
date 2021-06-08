import 'package:flutter/material.dart';
import 'contas.page.dart';
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
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
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
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.blue,
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    addConta(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addConta(BuildContext context) {
    Conta conta = new Conta();
    conta.descricao = _descricaoController.text;
    conta.saldo = num.parse(_saldoController.text);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Gravar Conta."),
              content: Text("Tem certeza que deseja Gravar a conta?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar.")),
                FlatButton(
                    onPressed: () async {
                      ContaHelper contaHelper = new ContaHelper();
                      await contaHelper.addConta(conta);
                      Navigator.pop(context);
                      confirmaConta(context);
                    },
                    child: Text("Confirmar."))
              ]);
        });
  }
}

void confirmaConta(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Gravar Conta."),
            content: Text("Conta Gravada com sucesso."),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contas()));
                  },
                  child: Text("Ok.")),
            ]);
      });
}
