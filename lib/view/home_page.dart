import 'package:flutter/material.dart';
import 'package:mi_control_academico/view/clase_hardware.dart';
import 'package:mi_control_academico/view/clase_web.dart';
import '../models/task.dart';
import 'package:mi_control_academico/view/clase_movil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<double> _promedios = [];

  String getRango(double promedio) {
    if (promedio >= 85) return "Sobresaliente";
    if (promedio >= 70) return "Aprobado";
    return "Reprobado";
  }

  double getPromedioGeneral() {
    if (_promedios.isEmpty) return 0.0;
    return _promedios.reduce((a, b) => a + b) / _promedios.length;
  }

  @override
  Widget build(BuildContext context) {
    double promedioGeneral = getPromedioGeneral();
    String rangoGeneral = getRango(promedioGeneral);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Control academico"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Joseph Carabantes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ClipOval(
              child: Image.network(
                'https://tse3.mm.bing.net/th/id/OIP.oTgCWvj2J6mAQgyRDx7jCgAAAA?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text("Mis clases: "),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final promedio = await Navigator.push<double>(
                  context,
                  MaterialPageRoute(builder: (context) => const ClaseMovil()),
                );
                if (promedio != null) {
                  setState(() {
                    _promedios.add(promedio);
                  });
                }
              },
              child: const Text('Programacion Movil II'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final promedio = await Navigator.push<double>(
                  context,
                  MaterialPageRoute(builder: (context) => const ClaseWeb()),
                );
                if (promedio != null) {
                  setState(() {
                    _promedios.add(promedio);
                  });
                }
              },
              child: const Text('Desarrollo de Portales Web II'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final promedio = await Navigator.push<double>(
                  context,
                  MaterialPageRoute(builder: (context) => const ClaseHardware()),
                );
                if (promedio != null) {
                  setState(() {
                    _promedios.add(promedio);
                  });
                }
              },
              child: const Text('Seminario de Hardware'),
            ),
            const SizedBox(height: 30),
            Text(
              'Promedio general: ${promedioGeneral.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rango: $rangoGeneral',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
