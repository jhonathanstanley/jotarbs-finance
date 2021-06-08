import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:jotarbs_finance/helpers/conta.helper.dart';
import 'package:jotarbs_finance/model/conta.dart';
import 'package:jotarbs_finance/model/movimentacao.dart';

class ContaCustomDialog extends StatefulWidget {
  final Conta conta;
  const ContaCustomDialog({Key key, this.conta}) : super(key: key);

  @override
  _ContaCustomDialogState createState() => _ContaCustomDialogState();
}

class _ContaCustomDialogState extends State<ContaCustomDialog> {
  var formatter = new DateFormat('dd-MM-yyyy');
  bool edit;

  Color _colorContainer = Colors.green[400];
  Color _colorTextButtom = Colors.green;
  TextEditingController _controllerValor = TextEditingController();
  TextEditingController _controllerDesc = TextEditingController();

  ContaHelper _contaHelper = ContaHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.050)),
        title: Text(
          "Adicionar Conta",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: _colorContainer,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "R\$ ",
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.06),
                  ),
                  Flexible(
                    child: TextField(
                        controller: _controllerValor,
                        maxLength: 7,
                        style: TextStyle(fontSize: width * 0.05),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        decoration: new InputDecoration(
                          hintText: "0.00",
                          hintStyle: TextStyle(color: Colors.white54),
                          contentPadding: EdgeInsets.only(
                              left: width * 0.04,
                              top: width * 0.041,
                              bottom: width * 0.041,
                              right: width * 0.04), //15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [],
              ),
              TextField(
                  controller: _controllerDesc,
                  maxLength: 20,
                  style: TextStyle(fontSize: width * 0.05),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  decoration: new InputDecoration(
                    //hintText: "descrição",
                    labelText: "Descrição",
                    labelStyle: TextStyle(color: Colors.white54),
                    //hintStyle: TextStyle(color: Colors.grey[400]),
                    contentPadding: EdgeInsets.only(
                        left: width * 0.04,
                        top: width * 0.041,
                        bottom: width * 0.041,
                        right: width * 0.04),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: width * 0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_controllerValor.text.isNotEmpty &&
                            _controllerDesc.text.isNotEmpty) {
                          Conta conta1 = Conta();
                          String valor;
                          if (_controllerValor.text.contains(",")) {
                            valor = _controllerValor.text
                                .replaceAll(RegExp(","), ".");
                          } else {
                            valor = _controllerValor.text;
                          }
                          conta1.saldo = num.parse(valor);
                          conta1.descricao = _controllerDesc.text;
                          _contaHelper.addConta(conta1);
                          Navigator.pop(context, true);

                          //initState();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: width * 0.02,
                            bottom: width * 0.02,
                            left: width * 0.03,
                            right: width * 0.03),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "Confirmar",
                            style: TextStyle(
                                color: _colorTextButtom,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
