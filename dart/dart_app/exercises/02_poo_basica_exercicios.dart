void main() {
  // ============================
  // SECAO: CRIACAO DE UMA CLASSE SIMPLES
  // ============================
  print('[09] Classe Usuario declarada abaixo.');

  // ============================
  // SECAO: CRIACAO DE OBJETOS
  // ============================
  Usuario usuario = Usuario('Pedro', 22);
  print('[10] Usuario: ${usuario.nome}, idade: ${usuario.idade}');

  // ============================
  // SECAO: METODOS EM CLASSES
  // ============================
  Produto produto = Produto('Fone Bluetooth', 199.9);
  produto.mostrarResumo();

  // ============================
  // SECAO: CONSTRUTORES
  // ============================
  Pedido pedido = Pedido(501, 350.0);
  print('[12] Pedido #${pedido.numero}, valor R\$${pedido.valor}');

  // ============================
  // SECAO: CONSTRUTORES NOMEADOS
  // ============================
  Veiculo veiculo = Veiculo.novo('Hatch');
  print('[13] Veiculo: ${veiculo.modelo}, ligado: ${veiculo.ligado}');

  // ============================
  // SECAO: ENCAPSULAMENTO
  // ============================
  ContaBancaria conta = ContaBancaria('Julia', 1000.0);
  conta.depositar(200.0);
  conta.saldo = 500.0;
  print('[14] Titular: ${conta.titular}');
  print('[14] Saldo atual: R\$${conta.saldo}');

  // TODO: Tente definir saldo negativo para ver a protecao do setter.
}

class Usuario {
  String nome;
  int idade;

  Usuario(this.nome, this.idade);
}

class Produto {
  String nome;
  double preco;

  Produto(this.nome, this.preco);

  void mostrarResumo() {
    print('[11] Produto: $nome - R\$$preco');
  }
}

class Pedido {
  int numero;
  double valor;

  Pedido(this.numero, this.valor);
}

class Veiculo {
  String modelo;
  bool ligado;

  Veiculo(this.modelo, this.ligado);

  Veiculo.novo(this.modelo) : ligado = false;
}

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
