import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/pages/first_hand_selection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Escolha a primeira mão',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: FirstHandSelection(),
    );
  }
}
