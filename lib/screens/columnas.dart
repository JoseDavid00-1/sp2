import 'package:flutter/material.dart';

class DynamicColumnPage extends StatefulWidget {
  const DynamicColumnPage({super.key});

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
