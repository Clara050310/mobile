import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/carrinho.dart';

class TelaCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<Carrinho>(context);
    final rosaBebe = Colors.pink.shade100;
    final cinzaClaro = Colors.grey.shade200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: rosaBebe,
        title: const Text('Carrinho'),
      ),
      body: Container(
        color: cinzaClaro,
        padding: const EdgeInsets.all(16),
        child: carrinho.itens.isEmpty
            ? const Center(
                child: Text('Carrinho vazio'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: carrinho.itens.entries.map((entry) {
                        final produto = entry.key;
                        final quantidade = entry.value;

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(produto.nome),
                            subtitle: Text(
                                'Quantidade: $quantidade\nPreço unitário: R\$ ${produto.preco.toStringAsFixed(2)}'),
                            trailing: Text(
                              'R\$ ${(produto.preco * quantidade).toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    'Total: R\$ ${carrinho.totalPreco.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rosaBebe,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      carrinho.limpar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pedido finalizado com sucesso!')),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Finalizar Pedido', style: TextStyle(fontSize: 18)),
                  )
                ],
              ),
      ),
    );
  }
}
