import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';
import '../models/carrinho.dart';

class MenuProdutos extends StatelessWidget {
  const MenuProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final produtosProvider = Provider.of<Produto>(context);
    final carrinho = Provider.of<Carrinho>(context, listen: false);

    final rosaBebe = Colors.pink.shade100;
    final cinzaClaro = Colors.grey.shade200;

    return Container(
      color: cinzaClaro,
      padding: const EdgeInsets.all(16),
      child: produtosProvider.lista.isEmpty
          ? const Center(
              child: Text(
                'Nenhum produto cadastrado',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: produtosProvider.lista.length,
              itemBuilder: (context, index) {
                final produto = produtosProvider.lista[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produto.nome,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade200, // rosa bebê mais suave
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(produto.descricao),
                        const SizedBox(height: 8),
                        Text('Categoria: ${produto.categoria}'),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${produto.preco.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: rosaBebe,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              carrinho.adicionarProduto(produto);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${produto.nome} adicionado ao carrinho'),
                                  backgroundColor: Colors.pink.shade100,
                                ),
                              );
                            },
                            child: const Text('Comprar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
