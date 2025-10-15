import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClaseWeb extends StatefulWidget {
  const ClaseWeb({super.key});

  @override
  State<ClaseWeb> createState() => _ClaseWebState();
}

class _ClaseWebState extends State<ClaseWeb> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  double _promedio = 0.0;
  bool _calculado = false;

  void _calcularPromedio() {
    double nota1 = double.tryParse(_nota1Controller.text) ?? 0;
    double nota2 = double.tryParse(_nota2Controller.text) ?? 0;
    double nota3 = double.tryParse(_nota3Controller.text) ?? 0;
    setState(() {
      _promedio = (nota1 + nota2 + nota3) / 3;
      _calculado = true;
    });
  }

  void _regresar() {
    Navigator.pop(context, _promedio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Promedio de Notas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'I Parcial',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'II Parcial',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nota3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'III Parcial',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcularPromedio,
                  child: const Text('Calcular'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _calculado ? _regresar : null,
                  child: const Text('Regresar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Promedio final: ${_promedio.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nota1Controller.dispose();
    _nota2Controller.dispose();
    _nota3Controller.dispose();
    super.dispose();
  }
}
