import 'package:flutter/material.dart';

class CourseDetailWidget extends StatefulWidget {
  final String courseName;
  final String courseDescription;

  const CourseDetailWidget({
    Key? key,
    required this.courseName,
    required this.courseDescription,
  }) : super(key: key);

  @override
  _CourseDetailWidgetState createState() => _CourseDetailWidgetState();
}

class _CourseDetailWidgetState extends State<CourseDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.courseName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.courseDescription,
              style: TextStyle(fontSize: 16),
            ),
            // Aquí puedes añadir más información del curso
          ],
        ),
      ),
    );
  }
}
