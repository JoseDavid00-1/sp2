import 'package:flutter/material.dart';

class DynamicColumnPage extends StatefulWidget {
  DynamicColumnPage({required String cursoId, super.key});
  final temas = {
    "course": "Matemática 1",
    "topics": [
      {
        "id": "M101T1",
        "name": "Límites y Continuidad",
        "description":
            "Introducción al concepto de límites de funciones y su importancia en la continuidad. Análisis de comportamientos en puntos de discontinuidad."
      },
      {
        "id": "M101T2",
        "name": "Derivadas",
        "description":
            "Estudio de la derivada como tasa de cambio instantánea. Aplicaciones en la física, economía y otros campos. Técnicas de derivación."
      },
      {
        "id": "M101T3",
        "name": "Aplicaciones de la Derivada",
        "description":
            "Exploración de las aplicaciones de las derivadas en problemas de optimización, análisis de crecimiento y decrecimiento de funciones, y puntos críticos."
      },
      {
        "id": "M101T4",
        "name": "Integrales",
        "description":
            "Introducción a las integrales indefinidas y definidas. Interpretación geométrica como el área bajo una curva y técnicas básicas de integración."
      },
      {
        "id": "M101T5",
        "name": "Aplicaciones de la Integral",
        "description":
            "Uso de integrales en problemas de áreas, volúmenes de sólidos de revolución, y aplicaciones en diversas disciplinas."
      }
    ]
  };

  final prerequisitos = {
    "course": "Matemática 1",
    "prerequisites": {
      "Límites y Continuidad": [
        {"id": "PR101", "name": "Funciones y Gráficas"},
        {"id": "PR102", "name": "Álgebra Básica"},
        {"id": "PR103", "name": "Concepto de Número Real"}
      ],
      "Derivadas": [
        {"id": "PR201", "name": "Límites"},
        {"id": "PR202", "name": "Función Lineal"},
        {"id": "PR203", "name": "Razones de Cambio"}
      ],
      "Aplicaciones de la Derivada": [
        {"id": "PR301", "name": "Derivadas"},
        {"id": "PR302", "name": "Funciones Polinomiales"},
        {"id": "PR303", "name": "Técnicas de Derivación"}
      ],
      "Integrales": [
        {"id": "PR401", "name": "Antiderivadas"},
        {"id": "PR402", "name": "Derivadas"},
        {"id": "PR403", "name": "Áreas Bajo la Curva"}
      ],
      "Aplicaciones de la Integral": [
        {"id": "PR501", "name": "Integrales"},
        {"id": "PR502", "name": "Geometría de Sólidos"},
        {"id": "PR503", "name": "Funciones Continuas"}
      ]
    }
  };
  @override
  // ignore: library_private_types_in_public_api
  _DynamicColumnPageState createState() => _DynamicColumnPageState();
}

class _DynamicColumnPageState extends State<DynamicColumnPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Columna izquierda que cambia dinámicamente
        Expanded(
          child: Center(
            child: Text(
              'Información para el elemento $_currentPage',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
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
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    color: Colors.blueAccent,
                    height: 200,
                    child: Center(
                      child: Text(
                        'Elemento $index',
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
        const Expanded(
          child: Center(
            child: Text(
              'Columna derecha fija',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
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
