import 'package:flutter/material.dart';
import 'package:jotarbs_finance/helpers/conta.helper.dart';
import 'package:jotarbs_finance/model/conta.dart';
import 'package:jotarbs_finance/widgets/Conta.CustomDialog.dart';

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

  Future<void> updateList() async {
    /*0 é o tipo de movimentaçao, que no caso é receita.*/
    List<Conta> newList = await helper.getAll();
    setState(() {
      widget.items = newList;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  _dialogAddRecDesp() async {
    final result = await showDialog(
        context: context,
        builder: (context) {
          return ContaCustomDialog();
        });

    if (result) {
      setState(() {
        updateList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas'),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: () {
            return load();
          },
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = widget.items[index];
              final descricao = item.descricao;
              final saldo = item.saldo;
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    descricao,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  trailing: Text(
                    'R\$ ' + saldo.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.black87.withOpacity(0.3),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await _dialogAddRecDesp();
          setState(() {});
        },
      ),
    );
  }
}
