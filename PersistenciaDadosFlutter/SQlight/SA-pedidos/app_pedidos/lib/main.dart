import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/carrinho.dart';
import 'screens/cadastro_produto.dart';
import 'screens/menu_produtos.dart';
import 'screens/carrinho_page.dart' hide Carrinho;

void main() {
  runApp(PedidosApp());
}

class PedidosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Carrinho(),
      child: MaterialApp(
        title: 'Clara Pedidos',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Callback para atualizar a lista de produtos quando cadastra novo produto
  void _atualizarProdutos() {
    setState(() {}); // força rebuild da tela de produtos para atualizar lista
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      MenuProdutos(), // Lista de produtos
      CadastroProduto(onProdutoCadastrado: _atualizarProdutos), // Cadastro
      TelaCarrinho(), // Carrinho
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Clara Pedidos')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Produtos'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Cadastrar'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
        ],
      ),
    );
  }
}
