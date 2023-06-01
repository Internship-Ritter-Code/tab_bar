import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({
    super.key,
    required this.wadahNamaAwal,
    required this.wadahNamaAkhir,
  });
  final String wadahNamaAwal;
  final String wadahNamaAkhir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Page"),
      ),
      body: Center(child: Text("New Page $wadahNamaAwal $wadahNamaAkhir")),
    );
  }
}
