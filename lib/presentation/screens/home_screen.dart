import 'package:flutter/material.dart';
import 'package:simpsons_web/models/personaje_model.dart';
import 'package:simpsons_web/services/personaje_service.dart';
import '../../widgets/no_data_widget.dart';
import '../../widgets/personaje_widget.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Personaje? personaje;
  final random = Random();
  List<int> idRepetida = [];
  int nuevaId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Los Simpsons'),
        elevation: 10,
        centerTitle: true,
      ),
      body: personaje == null
          ? NoDataWidget()
          : PersonajeWidget(personaje: personaje!),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          PersonajeService personajeService = PersonajeService();
          nuevaId = personajeAleatorio(idRepetida);
          personaje = await personajeService.getPersonaje(nuevaId);
          debugPrint('${personaje!.id}');
          debugPrint('$idRepetida');
          debugPrint(personaje!.name);
          setState(() {});
        },
        child: Icon(Icons.refresh_outlined),
      ),
    );
  }

  int personajeAleatorio(List<int> idRepetida) {
    int id;

    do {
      id = 1 + random.nextInt(100);
    } while (id == 0 || idRepetida.contains(id));

    idRepetida.add(id);

    return id;
  }
}
