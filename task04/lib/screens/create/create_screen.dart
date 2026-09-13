import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("اضافة مهمة جديدة"),
        titleTextStyle: TextStyle(fontFamily: "thmanyahsans", fontSize: 20),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF4e32f5),
      ),
      body: Padding(
        padding: .all(10),
        child: Expanded(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              Text("تفاصيل المهمة:"),
              Expanded(
                child: TextFormField(
                  controller: _taskController,
                  minLines: 7,
                  style: TextStyle(
                    color: Color(0xFF4e32f5),
                    fontFamily: "thmanyahsans",
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(),
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus!.unfocus(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
