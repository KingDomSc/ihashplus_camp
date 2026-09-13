import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
      title: "Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2 Test 2",
      imageKey: "A",
    ),
    Task(title: "Test 1", isCompleted: true),
    Task(title: "Test 3", imageKey: "Test"),
    Task(title: "Test 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 10,
        children: [
          Container(
            padding: .all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF4e32f5),
              borderRadius: .only(
                bottomLeft: .circular(20),
                bottomRight: .circular(20),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                spacing: 10,
                children: [
                  Text(
                    "مرحباً بك",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "thmanyahserifdisplay",
                      fontSize: 25,
                      fontFeatures: [FontFeature('ss01')],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .center,
                    children: [
                      Text(
                        "مهامك: 0/10",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "thmanyahsans",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/create");
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFF4e32f5),
                        ),
                        child: Wrap(
                          crossAxisAlignment: .center,
                          spacing: 5,
                          children: [
                            HugeIcon(icon: HugeIcons.strokeRoundedPlusMinus),
                            Text(
                              "اضافة مهمة",
                              style: TextStyle(
                                fontFamily: "thmanyahsans",
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ...tasks.map((el) {
            Task task = tasks[tasks.indexOf(el)];
            return Container(
              padding: .all(10),
              margin: .symmetric(vertical: 5, horizontal: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(10),
              ),
              child: Wrap(
                alignment: .start,
                runAlignment: .start,
                crossAxisAlignment: .start,
                spacing: 10,
                children: [
                  if (task.imageKey != null)
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: .circular(20),
                        border: .all(color: Color(0xFF4e32f5), width: 1),
                      ),
                    ),
                  Text(task.title),
                ],
              ),
            );
          }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Task {
  String? imageKey;
  final String title;
  bool isCompleted;
  final DateTime createdAt;
  Task({
    required this.title,
    this.imageKey,
    this.isCompleted = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
