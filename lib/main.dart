import 'package:flutter/material.dart';

import 'home.dart';
import 'study.dart';
import 'roadmaps.dart';
import 'insights.dart';
import 'settings.dart';

void main() {
  runApp(const StudyApp3());
}

class StudyApp3 extends StatelessWidget {
  const StudyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study App 3',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0B0C),
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF8A00),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentIndex = 0;

  final screens = const [
    HomeScreen(),
    StudyScreen(),
    RoadmapsScreen(),
    InsightsScreen(),
    SettingsScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: currentIndex,
        onChanged: changeTab,
      ),
    );
  }
}

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.home_rounded, 'Home'),
      (Icons.menu_book_rounded, 'Study'),
      (Icons.route_rounded, 'Roadmaps'),
      (Icons.insights_rounded, 'Insights'),
      (Icons.person_rounded, 'Profile'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111112),
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(.06),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Row(
            children: List.generate(items.length, (index) {
              final selected = index == currentIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFFFF8A00).withOpacity(.14)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index].$1,
                          size: 22,
                          color: selected
                              ? const Color(0xFFFF9D2E)
                              : Colors.white54,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          items[index].$2,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                selected ? FontWeight.w700 : FontWeight.w500,
                            color: selected
                                ? const Color(0xFFFF9D2E)
                                : Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
