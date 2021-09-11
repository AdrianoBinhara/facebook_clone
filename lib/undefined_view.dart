import 'package:flutter/material.dart';

class UndefindedView extends StatelessWidget {
  final String name = '';
  const UndefindedView({Key? key, name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Rota para $name não definida'),
      ),
    );
  }
}
