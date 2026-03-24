import 'models/livro_exercicio.dart';
import 'services/biblioteca_exercicio_service.dart';

void main() {
  // ============================
  // SECAO: TRATAMENTO DE EXCECOES
  // ============================
  try {
    sacar(300.0, 100.0);
  } catch (erro) {
    print('[21] Erro capturado: $erro');
  } finally {
    print('[21] Bloco finally executado.');
  }

  // ============================
  // SECAO: ORGANIZACAO DE CODIGO EM MULTIPLOS ARQUIVOS
  // ============================
  LivroExercicio livro = LivroExercicio('POO para iniciantes', 'Professor A');
  print('[22] Livro criado em outro arquivo: ${livro.titulo}');

  // ============================
  // SECAO: USO DE IMPORT
  // ============================
  BibliotecaExercicioService biblioteca = BibliotecaExercicioService();
  biblioteca.adicionarLivro(livro);
  biblioteca.adicionarLivro(LivroExercicio('Dart no console', 'Professora B'));
  biblioteca.listarLivros();

  // ============================
  // SECAO: NULL SAFETY
  // ============================
  String? observacao;
  print('[24] Observacao inicial: $observacao');
  observacao = 'Retirar na biblioteca central';
  print('[24] Observacao final: ${observacao.toUpperCase()}');

  // ============================
  // SECAO: PARAMETROS OPCIONAIS
  // ============================
  exibirStatus('Pedido aprovado');
  exibirStatus('Pedido enviado', 'Codigo BR-999');

  // ============================
  // SECAO: PARAMETROS NOMEADOS
  // ============================
  cadastrarUsuario(nome: 'Ricardo');
  cadastrarUsuario(nome: 'Nina', idade: 30);

  // TODO: Crie uma funcao nomeada para cadastrar livro com ano opcional.
}

void sacar(double valor, double saldoAtual) {
  if (valor > saldoAtual) {
    throw Exception('Saldo insuficiente para saque.');
  }
  print('[21] Saque feito: R\$$valor');
}

void exibirStatus(String mensagem, [String? detalhe]) {
  if (detalhe != null) {
    print('[25] $mensagem - $detalhe');
  } else {
    print('[25] $mensagem');
  }
}

void cadastrarUsuario({required String nome, int idade = 18}) {
  print('[26] Usuario cadastrado: $nome, idade: $idade');
}
