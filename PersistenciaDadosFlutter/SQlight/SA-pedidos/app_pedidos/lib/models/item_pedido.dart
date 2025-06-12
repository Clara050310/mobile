import 'produto.dart';

class ItemPedido {
  final Produto produto;
  int quantidade;

  ItemPedido({
    required this.produto,
    this.quantidade = 1,
  });

  double get subtotal => produto.preco * quantidade;
}
