import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Remove a cor de fundo
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Ação do botão voltar
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.black),
              onPressed: () {
                // Ação do botão editar
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 👤 Ícone de Pessoa
              Positioned(
                child: Icon(Icons.person) ),
              

              // 🏷 Nome e Cidade
              const SizedBox(height: 10),
              const Text(
                'Nome do Usuário',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Cidade, Estado',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 10),

              // ⭐ Estrelas (até 5)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 30),
                ),
              ),

              const SizedBox(height: 20),

              // 🟩 3 Containers Verdes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 40),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 📋 7 Linhas com Informações
              Column(
                children: List.generate(
                  7,
                  (index) => ListTile(
                    leading: Icon(Icons.info, color: Colors.blueAccent),
                    title: Text('Informação ${index + 1}'),
                    subtitle: Text('Detalhes sobre a informação ${index + 1}'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    color: Colors.blue[800],
                    iconSize: 40,
                    onPressed: () {
                      // Ação ao clicar no ícone do Facebook
                      print("Facebook Pressionado");
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.alternate_email),
                    color: Colors.blue[400],
                    iconSize: 40,
                    onPressed: () {
                      // Ação ao clicar no ícone do Twitter
                      print("Twitter Pressionado");
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.pink,
                    iconSize: 40,
                    onPressed: () {
                      // Ação ao clicar no ícone do Instagram
                      print("Instagram Pressionado");
                    },
    ), // ✅ Fechamento correto do último IconButton
  ],
),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
