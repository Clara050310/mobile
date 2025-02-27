import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
    title: Text('Minha Aplicação'),
  backgroundColor: const Color.fromARGB(255, 77, 14, 185),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        print('Clicou na lupa');
      },
    ),
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {
        print('Clicou no sino');
      },
    ),
  ],
);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Text("inicio"),
              Text("Conteudo"),
              Text("Contato"),
            ],
          ),
        ),
        body: Center(
          child: Text('Conteúdo da tela', style: TextStyle(fontSize: 20)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Botão pressionado!');
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
