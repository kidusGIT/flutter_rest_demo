import 'package:flutter/material.dart';

class FloatBtn extends StatelessWidget {
  const FloatBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/Detail', arguments: 0);
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
