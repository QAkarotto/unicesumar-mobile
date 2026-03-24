void main() {
  // ============================
  // SECAO: HERANCA
  // ============================
  Cliente cliente = Cliente('Amanda', 77);
  print('[15] Cliente: ${cliente.nome}, codigo: ${cliente.codigo}');

  // ============================
  // SECAO: SOBRESCRITA DE METODOS (OVERRIDE)
  // ============================
  Animal animal = Cachorro();
  animal.emitirSom();

  // ============================
  // SECAO: CLASSES ABSTRATAS
  // ============================
  Documento documento = Cpf();
  documento.validar();

  // ============================
  // SECAO: INTERFACES USANDO IMPLEMENTS
  // ============================
  Relatorio relatorio = Relatorio();
  relatorio.imprimir();

  // ============================
  // SECAO: MIXINS
  // ============================
  ServicoPedido servico = ServicoPedido();
  servico.criarPedido();

  // ============================
  // SECAO: VARIAVEIS E METODOS ESTATICOS
  // ============================
  ConfiguracaoSistema.mostrarAmbiente();

  // TODO: Crie uma classe Gato que sobrescreve emitirSom().
}

class Pessoa {
  String nome;

  Pessoa(this.nome);
}

class Cliente extends Pessoa {
  int codigo;

  Cliente(super.nome, this.codigo);
}

class Animal {
  void emitirSom() {
    print('[16] Som generico de animal.');
  }
}

class Cachorro extends Animal {
  @override
  void emitirSom() {
    print('[16] Cachorro: Au au!');
  }
}

abstract class Documento {
  void validar();
}

class Cpf extends Documento {
  @override
  void validar() {
    print('[17] CPF validado.');
  }
}

class Imprimivel {
  void imprimir() {}
}

class Relatorio implements Imprimivel {
  @override
  void imprimir() {
    print('[18] Imprimindo relatorio.');
  }
}

mixin LogOperacao {
  void registrar(String mensagem) {
    print('[19][LOG] $mensagem');
  }
}

class ServicoPedido with LogOperacao {
  void criarPedido() {
    registrar('Pedido criado.');
  }
}

class ConfiguracaoSistema {
  static String ambiente = 'Desenvolvimento';

  static void mostrarAmbiente() {
    print('[20] Ambiente atual: $ambiente');
  }
}
