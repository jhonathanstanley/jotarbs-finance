import 'package:flutter/material.dart';
import 'package:jotarbs_finance/helpers/conta.helper.dart';
import 'package:jotarbs_finance/model/conta.dart';

class MovimentacaoWidget extends StatefulWidget {
  int _type;
  MovimentacaoWidget(this._type);

  @override
  _MovimentacaoWidgetState createState() => _MovimentacaoWidgetState();
}

class _MovimentacaoWidgetState extends State<MovimentacaoWidget> {
  List<Conta> list;
  var contaHelper = new ContaHelper();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title:
          this.widget._type == 0 ? Text('Nova Receita') : Text('Nova Despesa'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  icon: Icon(Icons.account_box),
                ),
              ),
              DropdownButton(
                  hint: Text('Selecione a conta'),
                  items: [],
                  onChanged: (value) {}),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        RaisedButton(
            child: Text("Salvar"),
            onPressed: () {
              // your code
            })
      ],
    );
  }
}
