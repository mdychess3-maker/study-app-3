import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import 'study.dart';
import 'roadmaps.dart';
import 'insights.dart';
import 'settings.dart';

const Color appBlack = Color(0xFF09090A);
const Color surface = Color(0xFF121214);
const Color surface2 = Color(0xFF171719);
const Color orange = Color(0xFFFF8A00);
const Color orangeLight = Color(0xFFFFA52F);

void main() {
  runApp(const StudyApp3());
}

class StudyApp3 extends StatelessWidget {
  const StudyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark(useMaterial3: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study App 3',
      theme: base.copyWith(
        scaffoldBackgroundColor: appBlack,
        colorScheme: ColorScheme.fromSeed(
          seedColor: orange,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.interTextTheme(
          base.textTheme,
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        splashColor: orange.withOpacity(.08),
        highlightColor: orange.withOpacity(.04),
        dividerColor: Colors.white.withOpacity(.06),
        appBarTheme: const AppBarTheme(
          backgroundColor: appBlack,
          elevation: 0,
        ),
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
        color: const Color(0xFF0E0E0F),
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(.07),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.35),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Row(
            children: List.generate(items.length, (index) {
              final selected = index == currentIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? orange.withOpacity(.14)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: selected
                          ? Border.all(
                              color: orange.withOpacity(.10),
                            )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScale(
                          duration: const Duration(milliseconds: 180),
                          scale: selected ? 1.08 : 1,
                          child: Icon(
                            items[index].$1,
                            size: 22,
                            color: selected
                                ? orangeLight
                                : Colors.white.withOpacity(.48),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          items[index].$2,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: selected
                                ? orangeLight
                                : Colors.white.withOpacity(.48),
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
