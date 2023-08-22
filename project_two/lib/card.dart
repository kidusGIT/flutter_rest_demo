import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final someText;
  final TextEditingController controller;
  MyCard({super.key, this.someText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Image.asset(
            'assets/image.jpg',
          ),
          const SizedBox(
            // used as margin top
            height: 20,
          ),
          Text(
            someText,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            // used as margin top
            height: 20,
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Enter Some Text",
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ]),
      ),
    );
  }
}
