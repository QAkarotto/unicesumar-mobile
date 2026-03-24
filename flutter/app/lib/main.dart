import 'package:flutter/material.dart';

// Ponto de entrada da aplicacao Flutter.
// O runApp recebe o widget raiz e inicia a renderizacao na tela.
void main() {
  runApp(const AulaWidgetsApp());
}

// Widget raiz do app.
// Como nao existe estado interno aqui, usamos StatelessWidget.
class AulaWidgetsApp extends StatelessWidget {
  const AulaWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura aspectos globais:
    // tema, titulo, banner de debug e rota inicial (home).
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula Flutter: Widgets e Layouts',
      theme: ThemeData(
        // ColorScheme.fromSeed facilita criar uma paleta coerente.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // Tela principal da aula.
      home: const PaginaAulaWidgets(),
    );
  }
}

// Tela principal.
// Aqui usamos StatefulWidget para demonstrar mudancas visuais com setState.
class PaginaAulaWidgets extends StatefulWidget {
  const PaginaAulaWidgets({super.key});

  @override
  State<PaginaAulaWidgets> createState() => _PaginaAulaWidgetsState();
}

// Classe de estado associada a PaginaAulaWidgets.
class _PaginaAulaWidgetsState extends State<PaginaAulaWidgets> {
  // Estado principal didatico: contador do app base do Flutter.
  int _counter = 0;

  // setState dispara novo build e atualiza a interface.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: barra superior com titulo da tela.
      appBar: AppBar(
        title: const Text('Widgets, Layouts e Componentizacao'),
        centerTitle: true,
      ),
      // Body com Center para manter o conteudo centralizado horizontalmente.
      body: Center(
        // SingleChildScrollView evita overflow em telas menores.
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Counter + Widgets + Layout + Componentizacao',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Valor atual: $_counter',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Valor\n$_counter',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Dobro\n${_counter * 2}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Triplo\n${_counter * 3}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              CustomCard(
                titulo: 'Contador: $_counter',
                icone: Icons.exposure,
                corFundo: Color(0xFFFFF3E0),
              ),
              const SizedBox(height: 12),
              CustomCard(
                titulo: 'Dobro: ${_counter * 2}',
                icone: Icons.filter_2,
                corFundo: Color(0xFFE3F2FD),
              ),
              const SizedBox(height: 12),
              CustomCard(
                titulo: 'Paridade: ${_counter.isEven ? 'Par' : 'Impar'}',
                icone: _counter.isEven
                    ? Icons.check_circle
                    : Icons.change_circle,
                corFundo: Color(0xFFE8F5E9),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _decrementCounter,
                      icon: const Icon(Icons.remove),
                      label: const Text('Menos'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _resetCounter,
                      icon: const Icon(Icons.restart_alt),
                      label: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _incrementCounter,
                      icon: const Icon(Icons.add),
                      label: const Text('Mais'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}

// Passo 4: componente reutilizavel para evitar repeticao e organizar melhor o codigo.
class CustomCard extends StatelessWidget {
  // Propriedades que chegam de fora (composicao por parametros).
  final String titulo;
  final IconData icone;
  final Color corFundo;

  const CustomCard({
    super.key,
    required this.titulo,
    required this.icone,
    required this.corFundo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Faz o card ocupar toda a largura disponivel no eixo horizontal.
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          // Icone recebido por parametro.
          Icon(icone, size: 28),
          const SizedBox(width: 12),
          Expanded(
            // Expanded aqui evita quebra de layout com textos maiores.
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
