import 'package:agenda/telas/contatos_form.dart';
import 'package:agenda/telas/contatos_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const INICIAL = '/';
  static const CONTATOS_FORM = 'contatos-form';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      routes: {
        INICIAL: (context) => ContatosList(),
        CONTATOS_FORM: (context) => ContatosForm()
      },
    );
  }
}
