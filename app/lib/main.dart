import 'package:app/routes/app_routes.dart';
import 'package:app/views/filme_form.dart';
import 'package:flutter/material.dart';
import 'package:app/provider/filmes.dart';
import 'package:app/views/filme_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/filme.dart';

void main() async {

  // await Hive.initFlutter();

  // var box = await Hive.openBox('banco');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Filmes(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const FilmeList(),
        routes: {
          AppRoutes.home:(_) => const FilmeList(), 
          AppRoutes.filmeForm: (_) => const FilmeForm()
        },
      ),
    );
  }
}
