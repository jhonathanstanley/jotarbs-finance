import 'package:flutter/material.dart';
import 'package:jotarbs_finance/screens/tabs.page.dart';

/*Função main
* Inicia uma MaterialApp e passa o tema da aplicação.
* Define como Home um TabController, essa classe cria um controller para o TabMenu. É necessário
* passar a quantidade de tabs e a página dart que vai renderizar esse menu, no caso a TabsPage(),
* passei também a prop initialIndex, para o app iniciar sempre na tab do meio (HomePage)*/
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'JotaRBS Finance',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: DefaultTabController(
      length: 5,
      child: TabsPage(),
      initialIndex: 0,
    ),
  ));
}
