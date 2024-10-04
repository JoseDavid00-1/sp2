import 'package:flutter/material.dart';
import 'package:sp2/screens/tema_screen.dart';
import 'package:sp2/widgets/card_course.dart';

class ColumnSemester extends StatelessWidget {
  final MapEntry<String, List<Map<String, dynamic>>> semester;
  const ColumnSemester({required this.semester, super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        children: [
          Expanded(
              child: SizedBox(
            width: currentWidth * 9 / 10,
            child: Column(
              children: [
                SizedBox(
                    height: 100,
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          semester.key,
                          style: const TextStyle(
                              fontSize: 70,
                              color: Color.fromARGB(255, 31, 41, 55)),
                        ),
                      ],
                    ))),
                Expanded(
                  child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: GridView.count(
                            controller:
                                ScrollController(keepScrollOffset: false),
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            childAspectRatio: (1.1),
                            children: semester.value.map((course) {
                              return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      MaterialPageRoute route =
                                          MaterialPageRoute(
                                              builder: (context) => TemaScreen(
                                                  cursoID: course["id"]));
                                      Navigator.push(context, route);
                                    },
                                    child: CourseCard(
                                      name: course["name"],
                                      borderColor: Color(course["color"]),
                                    ),
                                  ));
                            }).toList(),
                          ))),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
