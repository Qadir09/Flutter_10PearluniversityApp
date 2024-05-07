import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../module/course.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => ExploreViewState();
}

class ExploreViewState extends State<Explore> {
  List<Course> courses = [
    Course(
        name: 'Basic of Salesforce Marketing Cloud ',
        instructorName: 'Myra Rafique',
        duration: '45 Minute',
        complexity: 'Beginner',
        picture: 'assets/images/picture1.jpg',
        link:
            'https://10pearlsuniversity.org/courses/basics-of-salesforce-marketing-cloud/'),
    Course(
        name: 'Cloud Computing Basics',
        instructorName: 'Ahmed Bilal',
        duration: '1.5 Hour',
        complexity: 'Beginner',
        picture: 'assets/images/Website-Thumbnail.jpg',
        link: 'https://10pearlsuniversity.org/courses/cloud-computing-basics/'),
    Course(
        name: 'Introduction to Computer Science',
        instructorName: 'Asmaa Nadeem',
        duration: '1.5 Hour',
        complexity: 'Beginner',
        picture: 'assets/images/introduction-to-computer-science.jpg',
        link:
            'https://10pearlsuniversity.org/courses/introduction-to-computer-science/'),
    Course(
        name: 'Fundamentals of C#',
        instructorName: 'Salman Masood',
        duration: '3 Hour',
        complexity: 'Beginner',
        picture: 'assets/images/fundamentals-of-c.jpg',
        link: 'https://10pearlsuniversity.org/courses/fundamentals-of-c/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: ListView.separated(
        itemCount: courses.length,
        padding: EdgeInsets.all(20),
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 2,
            color: Colors.black,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap action here
            },
            child: Column(
              children: [
                Text(
                  courses[index].name!,
                  style: TextStyle(fontSize: 16),
                ),
                QrImageView(
                  data: courses[index].link ?? '', // Handle null case here
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
