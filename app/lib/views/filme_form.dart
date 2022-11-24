import 'package:app/provider/filmes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filme.dart';

class FilmeForm extends StatefulWidget {
  const FilmeForm({super.key});

  @override
  State<FilmeForm> createState() => _FilmeFormState();
}

class _FilmeFormState extends State<FilmeForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void _loadFormData(Filme filme){
    _formData['id'] = filme.id;
    _formData['nome'] = filme.nome;
    _formData['preco'] = filme.preco;
    _formData['quantidade'] = filme.quantidade;
    _formData['urlImagem'] = filme.urlImagem;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final filme = ModalRoute.of(context)?.settings.arguments;
    
    if(filme != null){
      _loadFormData(filme as Filme);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de filme'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if(isValid){
                  _form.currentState!.save();
                  Provider.of<Filmes>(context, listen: false).put(
                    Filme(
                      id: _formData['id'] == null ? '' : _formData['id'].toString(),
                      nome: _formData['nome'] as String,
                      preco: double.parse(_formData['preco'] as String),
                      quantidade: int.parse(_formData['quantidade'] as String),
                      urlImagem: _formData['urlImagem'] == null ? '' : _formData['urlImagem'] as String
                    )
                  );
                  Navigator.of(context).pop();
                }

              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'] == null ? '' : _formData['nome'].toString(),
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if(value == null || value.toString().trim().isEmpty) return 'Nome obrigatório';

                  return null;
                },
                onSaved: (value) => _formData['nome'] = value as Object,
              ),
              TextFormField(
                initialValue: _formData['preco'] == null ? '' : _formData['preco'].toString(),
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
                validator: (value) {
                  if(value == null || value.toString().trim().isEmpty) return 'Preço é obrigatório';
                  if(double.parse(value) < 0) return 'Preço não pode ser negativo';

                  return null;
                },
                onSaved: (value) => _formData['preco'] = value as Object,
              ),
              TextFormField(
                initialValue: _formData['quantidade'] == null ? '' : _formData['quantidade'].toString(),
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                validator: (value) {
                  if(value == null || value.toString().trim().isEmpty) return 'Quantidade é obrigatório';
                  if(int.parse(value) < 0) return 'Quantidade não pode ser negativa';

                  return null;
                },
                onSaved: (value) => _formData['quantidade'] = value as Object,
              ),
              TextFormField(
                initialValue: _formData['urlImagem'] == null ? '' : _formData['urlImagem'].toString(),
                decoration: const InputDecoration(labelText: 'Url da imagem'),
                onSaved: (value) => _formData['urlImagem'] = value as Object,
              )
            ],
          )
        ),
      ),
    );
  }
}
