import 'package:flutter/material.dart';
import 'produto.dart';

class ProdutoProvider with ChangeNotifier {
  final List<Produto> _produtos = [];

  List<Produto> get produtos => [..._produtos];

  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
    notifyListeners();
  }

  void limparProdutos() {
    _produtos.clear();
    notifyListeners();
  }

  void removerProduto(Produto produto) {
  _produtos.remove(produto);
  notifyListeners();
}

}
