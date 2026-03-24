/*Conteúdo do arquivo main.dart mostrado em sala na aula de Widgets. Para exercutar substituir no arquivo main.dart*/

import 'package:flutter/material.dart';

void main() {
  runApp(const AulaWidgetsApp());
}

class AulaWidgetsApp extends StatelessWidget {
  const AulaWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passo 5 - App Completo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PaginaAulaWidgets(),
    );
  }
}

class PaginaAulaWidgets extends StatefulWidget {
  const PaginaAulaWidgets({super.key});

  @override
  State<PaginaAulaWidgets> createState() => _PaginaAulaWidgetsState();
}

class _PaginaAulaWidgetsState extends State<PaginaAulaWidgets> {
  int _counter = 0;

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
      appBar: AppBar(
        title: const Text('Passo 5: Uso do Componente'),
        centerTitle: true,
      ),
      body: Center(
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

class CustomCard extends StatelessWidget {
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
          Icon(icone, size: 28),
          const SizedBox(width: 12),
          Expanded(
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
