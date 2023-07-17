import 'package:flutter/material.dart';

class BuTton extends StatefulWidget {
  final String word;
  const BuTton({super.key ,required this.word});

  @override
  State<BuTton> createState() => _BuTtonState();
}

class _BuTtonState extends State<BuTton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, width: 100,
      decoration: BoxDecoration(color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text(widget.word)),
    );
  }
}
