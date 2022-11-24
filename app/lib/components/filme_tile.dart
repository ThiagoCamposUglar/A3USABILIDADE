import 'package:app/provider/filmes.dart';
import 'package:provider/provider.dart';

import '../models/filme.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class FilmeTile extends StatelessWidget {
  final Filme filme;

  const FilmeTile(this.filme, {super.key});

  @override
  Widget build(BuildContext context) {
    final imagem = filme.urlImagem.isEmpty
        ? const CircleAvatar(child: Icon(Icons.movie))
        : CircleAvatar(backgroundImage: NetworkImage(filme.urlImagem));

    return ListTile(
      leading: imagem,
      title: Text(filme.nome),
      subtitle: Text(
          "Preço: ${filme.preco.toString().replaceAll('.', ',')}(BRL)\nQuantidade: ${filme.quantidade}"),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.filmeForm, arguments: filme);
                },
                color: Colors.blue,
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: const Text('Ecluir filme'),
                            content: const Text('Tem certeza?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text('Não')),
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text('Sim')),
                            ],
                          )).then((comfirmou) => {
                            if(comfirmou){
                              Provider.of<Filmes>(context, listen: false).remove(filme)
                            }
                          });
                },
                color: Colors.red,
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
