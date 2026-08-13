import 'package:flutter/material.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Study',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Your subjects, topics and learning tools.',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 24),
            _StudyOption(
              icon: Icons.menu_book_rounded,
              title: 'Subjects',
              subtitle: 'Manage your subjects and chapters.',
              onTap: () {},
            ),
            _StudyOption(
              icon: Icons.description_outlined,
              title: 'Notes',
              subtitle: 'Create and organize your study notes.',
              onTap: () {},
            ),
            _StudyOption(
              icon: Icons.style_rounded,
              title: 'Flashcards',
              subtitle: 'Create your own swipeable flashcard decks.',
              onTap: () {},
            ),
            _StudyOption(
              icon: Icons.quiz_outlined,
              title: 'Quizzes',
              subtitle: 'Create and take your own quizzes.',
              onTap: () {},
            ),
            _StudyOption(
              icon: Icons.fitness_center_rounded,
              title: 'Practice',
              subtitle: 'Practice questions whenever you want.',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _StudyOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _StudyOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: const Color(0xFF151516),
        borderRadius: BorderRadius.circular(19),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(19),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8A00).withOpacity(.12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFFFF9D2E),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 0.45),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
