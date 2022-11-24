import 'dart:math';

import 'package:app/data/dummy_filmes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../models/filme.dart';

class Filmes with ChangeNotifier{
  final Map<String, Filme> _items = {...dummyFiles};

  List<Filme> get all{
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Filme byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Filme filme){

    if(filme.id.toString().isNotEmpty && _items.containsKey(filme.id)){
      _items.update(filme.id.toString(), (_) => Filme(
        id: filme.id,
        nome: filme.nome,
        preco: filme.preco,
        quantidade: filme.quantidade,
        urlImagem: filme.urlImagem
      ));
    }
    else{
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(id, () => Filme(
        id: id,
        nome: filme.nome,
        preco: filme.preco,
        quantidade: filme.quantidade,
        urlImagem: filme.urlImagem
    ));
    }

    notifyListeners();
  }

  void remove(Filme filme){
    _items.remove(filme.id);
    notifyListeners();
  }

  // final _box = Hive.box('banco');

  // Iterable get all{
  //   return _box.values.cast<Map<String, Filme>>();
  // }

  // int get count {
  //   return _box.values.length;
  // }

  // Filme byIndex(int i){
  //   final filme = cast<Filme>(_box.getAt(i));

  //   return Filme(
  //     id: filme,
  //     nome: filme[1],
  //     preco: filme[2] as double,
  //     quantidade: filme[3] as int,
  //     urlImagem: filme[4]
  //   );
  // }

  // void put(Filme filme){

  //   if(filme.id.toString().isNotEmpty){
  //     _box.put(filme.id, [filme.nome, filme.preco, filme.quantidade, filme.urlImagem]);
  //   }
  //   else{
  //     final id = Random().nextDouble().toString();

  //     _box.put(id, [filme.nome, filme.preco, filme.quantidade, filme.urlImagem]);
  //   }

  //   notifyListeners();
  // }

  // void remove(Filme filme){
  //   _box.delete(filme.id);
  //   notifyListeners();
  // }
}