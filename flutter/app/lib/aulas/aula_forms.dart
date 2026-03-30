// LEMBRETE: adicione no pubspec.yaml em dependencies:
// google_fonts: ^6.2.1

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Ponto de entrada da aplicacao.
void main() {
  runApp(const AulaFormularioApp());
}

// Widget raiz: configura tema global, tipografia e rota inicial.
class AulaFormularioApp extends StatelessWidget {
  const AulaFormularioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Entrada de Dados e Formularios',
      theme: ThemeData(
        // Passo 1: seed gera uma paleta coerente em todo o app.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006A6A)),
        useMaterial3: true,
        // Passo 1: tipografia global para evitar repetir estilo em cada Text.
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const TelaFormulario(),
    );
  }
}

// Passo 2: StatefulWidget para manter controllers e estado do formulario.
class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  // Passo 2: chave para controlar/validar todo o Form de forma centralizada.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Passo 2: controllers para ler e manipular os valores digitados.
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // Boa pratica: liberar recursos quando o State for descartado.
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _registrarDados() {
    // Passo 5: so segue se todos os validadores retornarem nulo.
    if (_formKey.currentState!.validate()) {
      final String nome = _nomeController.text.trim();
      final String email = _emailController.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados registrados com sucesso: $nome - $email'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario com Validacao'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            // Passo 4: associa o Form a chave de validacao.
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Entrada de Dados, Formularios, Validacao e Temas',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Preencha os campos e valide as entradas antes de registrar.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // Passo 4: campo componentizado e reutilizavel.
                CampoEdicaoCustomizado(
                  controller: _nomeController,
                  labelText: 'Nome',
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                CampoEdicaoCustomizado(
                  controller: _emailController,
                  labelText: 'E-mail',
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    if (!valor.contains('@') || !valor.contains('.')) {
                      return 'Digite um e-mail valido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _registrarDados,
                  child: const Text('Registrar dados'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Passo 3: componente fora da tela principal para incentivar reuso.
class CampoEdicaoCustomizado extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;

  const CampoEdicaoCustomizado({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
