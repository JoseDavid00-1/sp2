import 'package:flutter/material.dart';

class Tema {
  final String titulo;
  final String descripcion;

  Tema({required this.titulo, required this.descripcion});
}

// ignore: must_be_immutable
class DynamicColumnPage extends StatefulWidget {
  DynamicColumnPage({required String cursoId, super.key});

  List<Tema> temasMatematica1 = [
    Tema(titulo: "Álgebra", descripcion: "Estudio de estructuras algebraicas."),
    Tema(
        titulo: "Geometría",
        descripcion: "Estudio de las propiedades del espacio."),
    Tema(
        titulo: "Cálculo",
        descripcion: "Análisis de cambios y tasas de variación."),
    Tema(
        titulo: "Estadística",
        descripcion: "Análisis de datos y probabilidades."),
    Tema(
        titulo: "Trigonometría",
        descripcion:
            "Estudio de las relaciones entre los ángulos y los lados de los triángulos.")
  ];

  @override
  // ignore: library_private_types_in_public_api
  _DynamicColumnPageState createState() => _DynamicColumnPageState();
}

class _DynamicColumnPageState extends State<DynamicColumnPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final Map<String, dynamic> prerequisitos = {
    "course": "Matemáticas",
    "prerequisites": {
      "Álgebra": [
        {"id": "PR101", "name": "Números Reales"},
        {"id": "PR102", "name": "Operaciones Básicas"},
        {"id": "PR103", "name": "Ecuaciones Lineales"}
      ],
      "Geometría": [
        {"id": "PR201", "name": "Álgebra Básica"},
        {"id": "PR202", "name": "Trigonometía"},
        {"id": "PR203", "name": "Proporciones"}
      ],
      "Cálculo": [
        {"id": "PR301", "name": "Álgebra"},
        {"id": "PR302", "name": "Geometría"},
        {"id": "PR303", "name": "Límites y Continuidad"}
      ],
      "Estadística": [
        {"id": "PR401", "name": "Álgebra"},
        {"id": "PR402", "name": "Probabilidad Básica"},
        {"id": "PR403", "name": "Análisis de Datos"}
      ],
      "Trigonometría": [
        {"id": "PR501", "name": "Álgebra"},
        {"id": "PR502", "name": "Geometría"},
        {"id": "PR503", "name": "Funciones Trigonométricas"}
      ]
    }
  };

  final Map<String, dynamic> cursosFuturos = {
    "course": "Matemáticas",
    "Futuros": {
      "Álgebra": ["Cálculo", "Estadística", "Matemáticas Discretas"],
      "Geometría": ["Trigonometría", "Cálculo", "Física"],
      "Cálculo": [
        "Análisis Matemático",
        "Ecuaciones Diferenciales",
        "Optimización"
      ],
      "Estadística": [
        "Investigación de Operaciones",
        "Análisis de Datos",
        "Econometría"
      ],
      "Trigonometría": ["Cálculo", "Física", "Ingeniería"]
    }
  };

  @override
  void initState() {
    super.initState();

    // Listener para detectar cambios de página
    _pageController.addListener(() {
      int page = _pageController.page!
          .round(); // Redondea para obtener la página actual
      if (_currentPage != page) {
        setState(() {
          _currentPage = page; // Actualiza el índice centrado
        });
      }
    });
  }

  List<Widget> _getPrerequisites() {
    String currentCourse =
        prerequisitos["prerequisites"].keys.elementAt(_currentPage);
    List<dynamic> currentPrerequisites =
        prerequisitos["prerequisites"][currentCourse];

    return currentPrerequisites.map<Widget>((prerequisite) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        color: Colors.greenAccent,
        child: Text(
          prerequisite["name"],
          style: const TextStyle(fontSize: 18),
        ),
      );
    }).toList();
  }

  List<Widget> _getFutureCourses() {
    String currentCourse =
        cursosFuturos["Futuros"].keys.elementAt(_currentPage);
    List<dynamic> futureCourses = cursosFuturos["Futuros"][currentCourse];
    return futureCourses.map<Widget>((course) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        color: Colors.blueAccent,
        child: Text(
          course,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Columna izquierda que cambia dinámicamente
        Expanded(
          child: Column(
            children: [
              Text(
                'Prerequisitos para ${prerequisitos["prerequisites"].keys.elementAt(_currentPage)}:',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListView(
                  children: _getPrerequisites(),
                ),
              ),
            ],
          ),
        ),

        // Columna central con el PageView
        Expanded(
          flex: 2,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              var tema = widget.temasMatematica1[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    color: Colors.blueAccent,
                    height: 200,
                    child: Center(
                      child: Text(
                        tema.titulo,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Columna derecha (se podría implementar algo similar para cambiar su contenido)
        Expanded(
          child: Column(
            children: [
              Text(
                'Cursos donde se utilizará ${cursosFuturos["Futuros"].keys.elementAt(_currentPage)}:',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Center(
                  child: ListView(
                    children: _getFutureCourses(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
