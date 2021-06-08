class Movimentacao {
  int id;
  String data;
  int type;
  String descricao;
  int conta;
  num valor;

  Movimentacao();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'data': data,
      'type': type,
      'descricao': descricao,
      'conta': conta,
      'valor': valor
    };

    return map;
  }

  Movimentacao.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    data = map['data'];
    type = map['type'];
    descricao = map['descricao'];
    conta = map['conta'];
    valor = map['valor'];
  }
}
