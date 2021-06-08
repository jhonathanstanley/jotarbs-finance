class Conta {
  int id;
  String descricao;
  num saldo;

  Conta();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'saldo': saldo
    };
    return map;
  }

  Conta.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    descricao = map['descricao'];
    saldo = map['saldo'];
  }
}
