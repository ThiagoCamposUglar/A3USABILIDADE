import 'package:app/components/filme_tile.dart';
import 'package:app/provider/filmes.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmeList extends StatelessWidget {
  const FilmeList({super.key});

  @override
  Widget build(BuildContext context) {
    final Filmes filmes = Provider.of(context);
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de filmes'),
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.filmeForm);
          }, icon: const Icon(Icons.add),)
        ],
      ),
      body: ListView.builder(
        itemCount: filmes.count,
        itemBuilder: (ctx, i) => FilmeTile(filmes.byIndex(i)),
        ),
    );
  }
}