import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';
import '../models/produto.dart';

class CadastroProduto extends StatefulWidget {
  final VoidCallback onProdutoCadastrado;

  const CadastroProduto({Key? key, required this.onProdutoCadastrado}) : super(key: key);

  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String descricao = '';
  String precoStr = '';
  String? categoria;

  final List<String> categoriasPreDefinidas = [
    'Bebidas',
    'Comidas',
    'Eletrônicos',
    'Roupas',
    'Acessórios',
  ];

  void salvarProduto() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final novoProduto = Produto(
        nome: nome,
        descricao: descricao,
        preco: double.parse(precoStr),
        categoria: categoria!, id: '',
      );

      Provider.of<Produto>(context, listen: false).adicionarProduto(novoProduto);

      widget.onProdutoCadastrado();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Produto cadastrado com sucesso!')),
      );

      _formKey.currentState!.reset();
      setState(() {
        categoria = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final rosaBebe = Colors.pink.shade100;
    final cinzaClaro = Colors.grey.shade200;

    return Container(
      color: cinzaClaro,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
              onSaved: (value) => nome = value!.trim(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Descrição',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              validator: (value) => value == null || value.isEmpty ? 'Informe a descrição' : null,
              onSaved: (value) => descricao = value!.trim(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Informe o preço';
                final preco = double.tryParse(value.replaceAll(',', '.'));
                if (preco == null || preco <= 0) return 'Informe um preço válido';
                return null;
              },
              onSaved: (value) => precoStr = value!.replaceAll(',', '.'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: categoria,
              decoration: InputDecoration(
                labelText: 'Categoria',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: categoriasPreDefinidas
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  categoria = val;
                });
              },
              validator: (value) => value == null ? 'Selecione uma categoria' : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: rosaBebe,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: salvarProduto,
              child: const Text('Salvar Produto', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
