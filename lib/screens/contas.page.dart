import 'package:flutter/material.dart';
import 'package:jotarbs_finance/helpers/conta.helper.dart';
import 'package:jotarbs_finance/model/conta.dart';

class Contas extends StatefulWidget {
  var items = new List<Conta>();

  @override
  _ContasState createState() => _ContasState();
}

class _ContasState extends State<Contas> {
  var helper = new ContaHelper();
  _ContasState() {
    load();
  }

  Future load() async {
    List<Conta> result = await helper.getAll();
    if (result != null) {
      return setState(() {
        widget.items = result;
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.items[index];
            final descricao = item.descricao;
            final saldo = item.saldo;
            return Container(
              child: ListTile(
                title: Text(descricao),
                subtitle: Text(saldo.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
