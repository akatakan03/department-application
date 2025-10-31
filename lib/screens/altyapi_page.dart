import 'package:flutter/material.dart';
import 'package:department_application/screens/enlarge_image_screen.dart';

final List<Map<String, String>> classrooms = [
  {"name": "Derslik-B1", "capacity": "36", "imagePath": "assets/images/classroom.jpg"},
  {"name": "Derslik-B2", "capacity": "15", "imagePath": "assets/images/classroom.jpg"},
  {"name": "Derslik-B3", "capacity": "18", "imagePath": "assets/images/classroom.jpg"},
  {"name": "Derslik-B4", "capacity": "24", "imagePath": "assets/images/classroom.jpg"},
  {"name": "Derslik-B5", "capacity": "15", "imagePath": "assets/images/classroom.jpg"},
  {"name": "Derslik-B6", "capacity": "18", "imagePath": "assets/images/classroom.jpg"},
  {"name": "Derslik-B7", "capacity": "54", "imagePath": "assets/images/classroom.jpg"},
];

class AltyapiPage extends StatelessWidget {
  const AltyapiPage({super.key});

  void _handleDoubleTap(BuildContext context, String classroomName, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnlargeImageScreen(
          classroomName: classroomName,
          imagePath: imagePath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: classrooms.length,
      itemBuilder: (BuildContext context, int index) {
        final classroom = classrooms[index];
        final classroomName = classroom['name']!;
        final capacity = classroom['capacity']!;
        final imagePath = classroom['imagePath']!;

        return GestureDetector(
          onDoubleTap: () {
            _handleDoubleTap(context, classroomName, imagePath);
          },
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              leading: Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(classroomName),
              subtitle: Text('Kapasite: $capacity'),
              trailing: const Icon(Icons.zoom_in_map),
            ),
          ),
        );
      },
    );
  }
}