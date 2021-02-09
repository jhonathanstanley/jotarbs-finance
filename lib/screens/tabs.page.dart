import 'package:flutter/material.dart';
import 'despesas.resumo.dart';
import 'home.page.dart';
import 'config.page.dart';
import 'contas.page.dart';
import 'receitas.resumo.dart';

/*TabsPage
* Essa página retorna um Scaffold (esqueleto de toda página de MaterialApp
* e o body desse esqueleto é um TabBarView (Widget que exibe páginas separadas por 'tabs'
* como Children colocamos as páginas (obrigatoriamente tem que ser a mesma quantidade informada na main.dart na
* propiedade length do DefaultTabController.
*
* O menu propriamente dito é o bottomNavigationBar, é aqui que criamos as tabs com ícones e labels.
* A conexão entre eles é automática, clicanto no tab 0 o TabBarView abre a página index 0. Claro que só
* funciona se a quantidade de tabs no menu tb for igual.
* */

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          HomePage(),
          ReceitasResumo(),
          DespesasResumo(),
          Contas(),
          ConfigPage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Home",
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            icon: new Icon(
              Icons.home_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Receitas",
                style: TextStyle(fontSize: 12, color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
            icon: new Icon(
              Icons.add_circle_outline,
              color: Colors.green,
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Despesas",
                style: TextStyle(fontSize: 11, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            icon: new Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Contas",
                style: TextStyle(fontSize: 12, color: Colors.orange),
                textAlign: TextAlign.center,
              ),
            ),
            icon: new Icon(
              Icons.remove_circle_outline,
              color: Colors.orange,
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Config",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            icon: new Icon(
              Icons.data_usage_sharp,
              color: Colors.grey,
            ),
          ),
        ],
        indicatorPadding: EdgeInsets.all(5),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black87,
      ),
    );
  }
}
