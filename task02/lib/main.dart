import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController taskController = TextEditingController();
  final List<Task> tasks = [
    Task(title: 'test 1'),
    Task(title: 'test 2'),
    Task(title: 'test 3'),
    Task(title: 'test 4'),
  ];

  void addTask({required String title}) {
    if (title.isEmpty) return;

    setState(() {
      tasks.add(Task(title: title));
    });

    taskController.clear();
  }

  void toggleTask(int taskIndex) {
    setState(() {
      tasks[taskIndex].isCompleted = !tasks[taskIndex].isCompleted;
    });
  }

  void deleteTask(int taskIndex) {
    setState(() {
      tasks.removeAt(taskIndex);
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CreateTaskDialog(
              onSave: () {
                Navigator.pop(context);
                addTask(title: taskController.text);
              },
              taskController: taskController,
            ),
          );
        },
        backgroundColor: Colors.deepPurple,
        shape: const CircleBorder(),
        child: Text("+", style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Container(
              padding: const .only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: .only(
                  bottomLeft: .circular(10),
                  bottomRight: .circular(10),
                ),
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .center,
                  children: [
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      mainAxisSize: .min,
                      children: [
                        Text(
                          "Tasks",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Think, Create, Complete a tasks.",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: const .symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: .circular(20),
                      ),
                      child: Text(
                        "${tasks.where((element) => element.isCompleted).length}/${tasks.length}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: .bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...tasks.map(
              (element) => ListTile(
                leading: Checkbox(
                  value: element.isCompleted,
                  onChanged: (_) => toggleTask(tasks.indexOf(element)),
                ),
                trailing: IconButton(
                  onPressed: () => deleteTask(tasks.indexOf(element)),
                  color: Colors.deepPurple,
                  padding: .all(5),
                  iconSize: 20,
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(tapTargetSize: .shrinkWrap),
                  icon: Icon(Icons.delete),
                ),
                title: Text(element.title),
                subtitle: Text(
                  "Created At: ${element.createdAt.year}-${element.createdAt.month}-${element.createdAt.day}",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTaskDialog extends StatelessWidget {
  final VoidCallback onSave;
  final TextEditingController taskController;
  const new({super.key, required this.onSave, required this.taskController});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: .center,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const .all(10),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .end,
          mainAxisSize: .min,
          spacing: 10,
          children: [
            TextField(
              controller: taskController,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                hintText: "Write task title...",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.deepPurple.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onSave,
              style: ButtonStyle(backgroundColor: .all(Colors.deepPurple)),
              child: Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  bool isCompleted;
  final DateTime createdAt;

  Task({required this.title, this.isCompleted = false, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
