import 'package:flutter/material.dart';
import '../models/produto.dart';

class Carrinho with ChangeNotifier {
  final Map<Produto, int> _itens = {};

  Map<Produto, int> get itens => Map.unmodifiable(_itens);

  int get totalItens => _itens.values.fold(0, (sum, qty) => sum + qty);

  double get totalPreco {
    double total = 0;
    _itens.forEach((produto, quantidade) {
      total += produto.preco * quantidade;
    });
    return total;
  }

  void adicionarProduto(Produto produto, [int quantidade = 1]) {
    if (_itens.containsKey(produto)) {
      _itens[produto] = _itens[produto]! + quantidade;
    } else {
      _itens[produto] = quantidade;
    }
    notifyListeners();
  }

  void removerProduto(Produto produto) {
    _itens.remove(produto);
    notifyListeners();
  }

  void alterarQuantidade(Produto produto, int quantidade) {
    if (quantidade <= 0) {
      removerProduto(produto);
    } else {
      _itens[produto] = quantidade;
      notifyListeners();
    }
  }

  void limpar() {
    _itens.clear();
    notifyListeners();
  }
}
