import 'package:flutter/material.dart';
import 'package:jotarbs_finance/helpers/movimentacao.helper.dart';
import 'package:jotarbs_finance/model/movimentacao.dart';
import 'package:jotarbs_finance/widgets/CustomDialog.dart';

class DespesasResumo extends StatefulWidget {
  var items = new List<Movimentacao>();
  @override
  _DespesasResumoState createState() => _DespesasResumoState();
}

class _DespesasResumoState extends State<DespesasResumo> {
  var helper = new MovimentacaoHelper();
  _DespesasResumoState() {
    load();
  }

  Future<void> updateList() async {
    /*0 é o tipo de movimentaçao, que no caso é receita.*/
    List<Movimentacao> newList = await helper.getMovimentacaoByType(1);
    setState(() {
      widget.items = newList;
    });
  }

  Future load() async {
    List<Movimentacao> result = await helper.getMovimentacaoByType(1);
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

  _dialogAddRecDesp() async {
    final result = await showDialog(
        context: context,
        builder: (context) {
          return CustomDialog();
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
        title: Text('Despesas'),
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
              final valor = item.valor;
              final conta = item.conta;
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
                  leading: Text(
                    conta.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Text(
                    'R\$ ' + valor.toString(),
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
                  color: Colors.red.withOpacity(0.3),
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
