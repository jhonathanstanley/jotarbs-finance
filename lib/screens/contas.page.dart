import 'package:flutter/material.dart';
import 'package:jotarbs_finance/helpers/conta.helper.dart';
import 'package:jotarbs_finance/model/conta.dart';

class Contas extends StatefulWidget {
  @override
  _ContasState createState() => _ContasState();
}

class _ContasState extends State<Contas> {
  var contaHelper = ContaHelper();
  
  
  @override
  void initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: contaHelper.getAll(),
        initialData: List(),
        builder: (context, snapshot){
          return snapshot.hasData ? 
          ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, int position){
              final item = snapshot.data[position];
              
            },
              
      ),
    );
  }
}
