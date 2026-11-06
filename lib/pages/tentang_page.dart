import 'package:flutter/material.dart';

class TentangPage extends StatefulWidget {
  const TentangPage({super.key, required this.title});
  final String title;
  @override
  State<TentangPage> createState() {
    return _TentangPageState(); // Seperti biasa, baris ini masih error.
  }
}

class _TentangPageState extends State<TentangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
