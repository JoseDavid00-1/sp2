import 'dart:convert'; // Para decodificar JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para realizar solicitudes HTTP

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Definimos el futuro que contiene la solicitud HTTP
  Future<dynamic> fetchData() async {
    final url = Uri.parse('http://54.144.99.98:3000/cursos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decodifica la respuesta JSON
      return jsonDecode(response.body);
    } else {
      // Retorna un mensaje de error en caso de falla
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data with FutureBuilder'),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: fetchData(), // Llama a la función fetchData
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un indicador de carga mientras se realiza la solicitud
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Muestra el error si la solicitud falla
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Muestra los datos obtenidos cuando la solicitud es exitosa
              return Text('Data fetched successfully: ${snapshot.data}');
            } else {
              // Maneja otros estados posibles (por ejemplo, datos vacíos)
              return Text('No data found');
            }
          },
        ),
      ),
    );
  }
}
