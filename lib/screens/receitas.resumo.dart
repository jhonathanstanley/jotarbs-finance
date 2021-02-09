import 'package:flutter/material.dart';

class ReceitasResumo extends StatefulWidget {
  @override
  _ReceitasResumoState createState() => _ReceitasResumoState();
}

class _ReceitasResumoState extends State<ReceitasResumo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Center(
        child: Text("Resumo das Receitas"),
      ),
    );
  }
}
