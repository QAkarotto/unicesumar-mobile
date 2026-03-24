import 'package:dart_examples/models/conta_bancaria.dart';
import 'package:dart_examples/models/livro.dart';
import 'package:dart_examples/services/biblioteca_service.dart';

void main() {
  secao01EstruturaBasica();
  secao02VariaveisETipos();
  secao03InterpolacaoStrings();
  secao04ControleFluxo();
  secao05Loops();
  secao06Funcoes();
  secao07Listas();
  secao08Mapas();
  secao09ClasseSimples();
  secao10CriacaoObjetos();
  secao11MetodosEmClasses();
  secao12Construtores();
  secao13ConstrutoresNomeados();
  secao14Encapsulamento();
  secao15Heranca();
  secao16Override();
  secao17ClassesAbstratas();
  secao18Interfaces();
  secao19Mixins();
  secao20Estaticos();
  secao21Excecoes();
  secao22OrganizacaoMultiplosArquivos();
  secao23UsoDeImport();
  secao24NullSafety();
  secao25ParametrosOpcionais();
  secao26ParametrosNomeados();
}

// ============================
// SECAO: ESTRUTURA BASICA DE UM PROGRAMA DART
// ============================
void secao01EstruturaBasica() {
  print('\n[01] Inicio do programa Dart no console.');
}

// ============================
// SECAO: VARIAVEIS E TIPOS BASICOS
// ============================
void secao02VariaveisETipos() {
  int quantidadeProdutos = 3;
  double preco = 49.90;
  String nomeProduto = 'Teclado';
  bool emEstoque = true;
  var categoria = 'Informatica';

  print('[02] int: $quantidadeProdutos');
  print('[02] double: $preco');
  print('[02] String: $nomeProduto');
  print('[02] bool: $emEstoque');
  print('[02] var: $categoria');
}

// ============================
// SECAO: INTERPOLACAO DE STRINGS
// ============================
void secao03InterpolacaoStrings() {
  String usuario = 'Ana';
  int pontos = 150;
  print('[03] Usuario $usuario possui $pontos pontos.');
}

// ============================
// SECAO: CONTROLE DE FLUXO
// ============================
void secao04ControleFluxo() {
  double valorPedido = 120.0;

  if (valorPedido >= 100) {
    print('[04] Pedido com frete gratis.');
  } else {
    print('[04] Pedido com frete pago.');
  }

  String status = 'enviado';
  switch (status) {
    case 'novo':
      print('[04] Pedido criado.');
      break;
    case 'enviado':
      print('[04] Pedido em transporte.');
      break;
    default:
      print('[04] Status desconhecido.');
  }
}

// ============================
// SECAO: LOOPS
// ============================
void secao05Loops() {
  print('[05] for:');
  for (int i = 1; i <= 3; i++) {
    print('  Produto $i cadastrado.');
  }

  print('[05] while:');
  int contador = 1;
  while (contador <= 2) {
    print('  Tentativa $contador de pagamento.');
    contador++;
  }

  print('[05] for-in:');
  List<String> categorias = ['Livros', 'Eletronicos', 'Roupas'];
  for (final categoria in categorias) {
    print('  Categoria: $categoria');
  }
}

// ============================
// SECAO: FUNCOES
// ============================
void secao06Funcoes() {
  saudacao();
  exibirProduto('Mouse', 99.9);

  double total = somar(15.0, 20.0);
  print('[06] Retorno da funcao somar: $total');

  int dobro = calcularDobro(12);
  print('[06] Arrow function (=>): dobro de 12 = $dobro');
}

void saudacao() {
  print('[06] Funcao simples: Bem-vindos a aula de Dart!');
}

void exibirProduto(String nome, double preco) {
  print('[06] Parametros: $nome custa R\$$preco');
}

double somar(double a, double b) {
  return a + b;
}

int calcularDobro(int valor) => valor * 2;

// ============================
// SECAO: LISTAS
// ============================
void secao07Listas() {
  List<String> usuarios = ['Ana', 'Bruno'];
  usuarios.add('Carlos');
  print('[07] Usuarios: $usuarios');
  print('[07] Primeiro usuario: ${usuarios[0]}');
}

// ============================
// SECAO: MAPAS
// ============================
void secao08Mapas() {
  Map<String, double> precos = {'Caderno': 20.0, 'Caneta': 3.5};

  precos['Borracha'] = 2.0;
  print('[08] Mapa de precos: $precos');
  print('[08] Preco da Caneta: ${precos['Caneta']}');
}

// ============================
// SECAO: CRIACAO DE UMA CLASSE SIMPLES
// ============================
class Usuario {
  String nome;
  int idade;

  Usuario(this.nome, this.idade);
}

void secao09ClasseSimples() {
  print('[09] Classe Usuario criada com nome e idade.');
}

// ============================
// SECAO: CRIACAO DE OBJETOS
// ============================
void secao10CriacaoObjetos() {
  Usuario usuario = Usuario('Marina', 21);
  print('[10] Objeto Usuario: ${usuario.nome}, ${usuario.idade} anos.');
}

// ============================
// SECAO: METODOS EM CLASSES
// ============================
class Produto {
  String nome;
  double preco;

  Produto(this.nome, this.preco);

  void mostrarResumo() {
    print('[11] Produto: $nome - R\$$preco');
  }
}

void secao11MetodosEmClasses() {
  Produto produto = Produto('Fone', 150.0);
  produto.mostrarResumo();
}

// ============================
// SECAO: CONSTRUTORES
// ============================
class Pedido {
  int numero;
  double valor;

  Pedido(this.numero, this.valor);
}

void secao12Construtores() {
  Pedido pedido = Pedido(1001, 250.0);
  print('[12] Pedido #${pedido.numero} com valor R\$${pedido.valor}');
}

// ============================
// SECAO: CONSTRUTORES NOMEADOS
// ============================
class Veiculo {
  String modelo;
  bool ligado;

  Veiculo(this.modelo, this.ligado);

  Veiculo.novo(this.modelo) : ligado = false;
}

void secao13ConstrutoresNomeados() {
  Veiculo carro = Veiculo.novo('Sedan');
  print('[13] Veiculo ${carro.modelo} iniciado com ligado=${carro.ligado}');
}

// ============================
// SECAO: ENCAPSULAMENTO
// ============================
void secao14Encapsulamento() {
  ContaBancaria conta = ContaBancaria('Joao', 1000.0);
  conta.depositar(250.0);
  conta.saldo = 500.0;
  print('[14] Titular: ${conta.titular}');
  print('[14] Saldo via getter: R\$${conta.saldo}');
}

// ============================
// SECAO: HERANCA
// ============================
class Pessoa {
  String nome;

  Pessoa(this.nome);
}

class Cliente extends Pessoa {
  int codigo;

  Cliente(super.nome, this.codigo);
}

void secao15Heranca() {
  Cliente cliente = Cliente('Paula', 10);
  print('[15] Cliente ${cliente.nome} com codigo ${cliente.codigo}');
}

// ============================
// SECAO: SOBRESCRITA DE METODOS (OVERRIDE)
// ============================
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

void secao16Override() {
  Animal animal = Cachorro();
  animal.emitirSom();
}

// ============================
// SECAO: CLASSES ABSTRATAS
// ============================
abstract class Documento {
  void validar();
}

class Cpf extends Documento {
  @override
  void validar() {
    print('[17] CPF validado com sucesso.');
  }
}

void secao17ClassesAbstratas() {
  Documento documento = Cpf();
  documento.validar();
}

// ============================
// SECAO: INTERFACES USANDO IMPLEMENTS
// ============================
class Imprimivel {
  void imprimir() {}
}

class Relatorio implements Imprimivel {
  @override
  void imprimir() {
    print('[18] Imprimindo relatorio de vendas.');
  }
}

void secao18Interfaces() {
  Relatorio relatorio = Relatorio();
  relatorio.imprimir();
}

// ============================
// SECAO: MIXINS
// ============================
mixin LogOperacao {
  void registrar(String mensagem) {
    print('[19][LOG] $mensagem');
  }
}

class ServicoPedido with LogOperacao {
  void criarPedido() {
    registrar('Pedido criado com sucesso.');
  }
}

void secao19Mixins() {
  ServicoPedido servico = ServicoPedido();
  servico.criarPedido();
}

// ============================
// SECAO: VARIAVEIS E METODOS ESTATICOS
// ============================
class ConfiguracaoSistema {
  static String ambiente = 'Desenvolvimento';

  static void mostrarAmbiente() {
    print('[20] Ambiente atual: $ambiente');
  }
}

void secao20Estaticos() {
  ConfiguracaoSistema.mostrarAmbiente();
}

// ============================
// SECAO: TRATAMENTO DE EXCECOES
// ============================
void sacar(double valor, double saldoAtual) {
  if (valor > saldoAtual) {
    throw Exception('Saldo insuficiente para saque.');
  }
  print('[21] Saque realizado: R\$$valor');
}

void secao21Excecoes() {
  try {
    sacar(200.0, 100.0);
  } catch (erro) {
    print('[21] Erro capturado: $erro');
  } finally {
    print('[21] Operacao finalizada.');
  }
}

// ============================
// SECAO: ORGANIZACAO DE CODIGO EM MULTIPLOS ARQUIVOS
// ============================
void secao22OrganizacaoMultiplosArquivos() {
  Livro livro = Livro('Clean Code', 'Robert C. Martin');
  print('[22] Livro criado em outro arquivo: ${livro.titulo}');
}

// ============================
// SECAO: USO DE IMPORT
// ============================
void secao23UsoDeImport() {
  final biblioteca = BibliotecaService();
  biblioteca.adicionarLivro(Livro('Dart Basico', 'Professor X'));
  biblioteca.adicionarLivro(Livro('POO na Pratica', 'Professora Y'));
  biblioteca.listarLivros();
}

// ============================
// SECAO: NULL SAFETY
// ============================
void secao24NullSafety() {
  String observacao;
  print('[24] Observacao inicial (nula): $observacao');

  observacao = 'Entrega prevista para amanha';
  print('[24] Observacao atual: ${observacao.toUpperCase()}');
}

// ============================
// SECAO: PARAMETROS OPCIONAIS
// ============================
void exibirMensagem(String texto, [String? complemento]) {
  if (complemento != null) {
    print('[25] $texto - $complemento');
  } else {
    print('[25] $texto');
  }
}

void secao25ParametrosOpcionais() {
  exibirMensagem('Pedido aprovado');
  exibirMensagem('Pedido enviado', 'Codigo de rastreio: BR123');
}

// ============================
// SECAO: PARAMETROS NOMEADOS
// ============================
void cadastrarUsuario({required String nome, int idade = 18}) {
  print('[26] Usuario cadastrado: $nome, idade: $idade');
}

void secao26ParametrosNomeados() {
  cadastrarUsuario(nome: 'Laura');
  cadastrarUsuario(nome: 'Carlos', idade: 25);
}
