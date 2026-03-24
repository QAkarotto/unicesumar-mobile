void main() {
  // ============================
  // SECAO: ESTRUTURA BASICA DE UM PROGRAMA DART
  // ============================
  print('[01] Inicio de um programa Dart de console.');

  // ============================
  // SECAO: VARIAVEIS E TIPOS BASICOS
  // ============================
  int idade = 20;
  double saldo = 199.90;
  String nome = 'Maria';
  bool ativo = true;
  var curso = 'Analise e Desenvolvimento';

  print('[02] int: $idade');
  print('[02] double: $saldo');
  print('[02] String: $nome');
  print('[02] bool: $ativo');
  print('[02] var: $curso');

  // TODO: Crie mais uma variavel de cada tipo e imprima.

  // ============================
  // SECAO: INTERPOLACAO DE STRINGS
  // ============================
  print('[03] Usuario $nome tem saldo de R\$$saldo.');

  // ============================
  // SECAO: CONTROLE DE FLUXO
  // ============================
  double valorPedido = 80.0;

  if (valorPedido >= 100) {
    print('[04] Frete gratis.');
  } else {
    print('[04] Frete pago.');
  }

  String status = 'novo';
  switch (status) {
    case 'novo':
      print('[04] Pedido criado.');
      break;
    case 'enviado':
      print('[04] Pedido enviado.');
      break;
    default:
      print('[04] Status nao reconhecido.');
  }

  // TODO: Troque o status e veja a saida de cada caso.

  // ============================
  // SECAO: LOOPS
  // ============================
  print('[05] for:');
  for (int i = 1; i <= 3; i++) {
    print('  Item $i');
  }

  print('[05] while:');
  int tentativas = 1;
  while (tentativas <= 2) {
    print('  Tentativa $tentativas');
    tentativas++;
  }

  print('[05] for-in:');
  List<String> produtos = ['Mouse', 'Teclado', 'Monitor'];
  for (final produto in produtos) {
    print('  Produto: $produto');
  }

  // ============================
  // SECAO: FUNCOES
  // ============================
  boasVindas();
  exibirPreco('Caderno', 24.5);

  double total = somar(10, 5);
  print('[06] Resultado da soma: $total');

  int triplo = calcularTriplo(4);
  print('[06] Arrow function: triplo de 4 = $triplo');

  // ============================
  // SECAO: LISTAS
  // ============================
  List<String> usuarios = ['Ana', 'Bruno'];
  usuarios.add('Carla');
  print('[07] Lista de usuarios: $usuarios');

  // ============================
  // SECAO: MAPAS
  // ============================
  Map<String, double> tabelaPrecos = {'Caneta': 2.5, 'Lapiseira': 12.0};
  tabelaPrecos['Borracha'] = 1.5;
  print('[08] Mapa de precos: $tabelaPrecos');

  // TODO: Remova um item da lista e um item do mapa, e imprima novamente.
}

void boasVindas() {
  print('[06] Bem-vindos ao bloco de funcoes.');
}

void exibirPreco(String nomeProduto, double preco) {
  print('[06] $nomeProduto custa R\$$preco');
}

double somar(double a, double b) {
  return a + b;
}

int calcularTriplo(int valor) => valor * 3;
