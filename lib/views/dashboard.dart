import 'package:flutter/material.dart';
import 'package:project_1/module/course.dart';
import 'package:project_1/views/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

import 'explore_view.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() => runApp(
      MaterialApp(
        home: MyHomePage(

          title: '10Pe@l App',

        ),
      ),
    );

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Course> courses = [
    Course(
        name: 'Salesforce Marketing Cloud ',
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
        name: 'Introduction Computer Science',
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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('10PE@RL APP'),
      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
                title: Text('Explore'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Explore()));
                }),
            ListTile(
              title: Text('Services'),
            ),
            ListTile(
              title: Text('Blog'),
            )
          ],
        ),
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
              _launchUrl(courses[index].link!);
            },
            child: Column(
              children: [
                Image.asset(
                  courses[index].picture!,
                  width: 350,
                  height: 350,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courses[index].name!,
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          courses[index].instructorName!,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Duration: ' + courses[index].duration!,
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Level: ' + courses[index].complexity!,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await canLaunch(url)) {
      throw Exception('Could not launch $url');
    } else {
      await launch(url);
    }
  }
}
