class ContaBancaria {
  String titular;
  double _saldo;

  ContaBancaria(this.titular, this._saldo);

  double get saldo => _saldo;

  set saldo(double novoSaldo) {
    if (novoSaldo >= 0) {
      _saldo = novoSaldo;
    }
  }

  void depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print('[14] Deposito de R\$$valor realizado.');
    }
  }
}
