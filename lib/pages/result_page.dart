import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.winner});

  final int winner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Resultado',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Center(
        child: Text(
          winner == 1 ? 'A primeira mão ganhou' : 'A segunda mão ganhou',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
