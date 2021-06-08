import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Tipo de moeda'),
            ),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Paleta de cores'),
            ),
            ListTile(
              leading: Icon(Icons.font_download_outlined),
              title: Text('Fonte'),
            ),
          ],
        ),
      ),
    );
  }
}
