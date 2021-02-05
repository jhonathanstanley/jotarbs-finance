class Movimentacao {
  int id;
  int type;
  int conta;
  num valor;

  Movimentacao(this.id, this.type, this.conta, this.valor);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'type': type,
      'conta': conta,
      'valor': valor
    };

    return map;
  }

  Movimentacao.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    type = map['type'];
    conta = map['conta'];
    valor = map['valor'];
  }
}
