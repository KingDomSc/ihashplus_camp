import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task03/screens/completed/completed_screen.dart';
import 'package:task03/screens/home/home_screen.dart';
import 'package:task03/screens/settings/setting_screen.dart';

class LayoutScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  static const screens = [
    (screen: HomeScreen(), icon: HugeIcons.strokeRoundedHome01),
    (screen: CompletedScreen(), icon: HugeIcons.strokeRoundedTaskDone01),
    (screen: SettingScreen(), icon: HugeIcons.strokeRoundedSetting07),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex].screen,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: .all(5),
          margin: .symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFF4e32f5),
            borderRadius: .circular(20),
          ),
          child: Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            spacing: 20,
            children: screens.map((el) {
              final index = screens.indexOf(el);
              final isSelected = index == currentIndex;
              return Container(
                padding: .all(10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  shape: .circle,
                ),
                child: GestureDetector(
                  behavior: .opaque,
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: HugeIcon(
                    icon: el.icon,
                    size: 25,
                    color: isSelected ? Color(0xFF4e32f5) : Colors.white70,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
