import 'package:flutter/material.dart';

const Color _orange = Color(0xFFFF8A00);
const Color _orangeLight = Color(0xFFFFA52F);

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Study',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w900,
                letterSpacing: -.8,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Your subjects, topics and learning tools.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 25),

            _StudyOption(
              icon: Icons.menu_book_rounded,
              title: 'Subjects',
              subtitle: 'Organize subjects, topics and chapters.',
              number: '01',
              onTap: () => _showComingSoon(
                context,
                'Subjects',
                'Your subject and chapter workspace will open here.',
              ),
            ),

            _StudyOption(
              icon: Icons.description_outlined,
              title: 'Notes',
              subtitle: 'Create and organize your study notes.',
              number: '02',
              onTap: () => _showComingSoon(
                context,
                'Notes',
                'Your notes workspace will open here.',
              ),
            ),

            _StudyOption(
              icon: Icons.style_rounded,
              title: 'Flashcards',
              subtitle: 'Create your own swipeable flashcard decks.',
              number: '03',
              onTap: () => _showComingSoon(
                context,
                'Flashcards',
                'Your swipeable flashcard decks will open here.',
              ),
            ),

            _StudyOption(
              icon: Icons.quiz_outlined,
              title: 'Quizzes',
              subtitle: 'Test yourself with quizzes and see your score.',
              number: '04',
              onTap: () => _showComingSoon(
                context,
                'Quizzes',
                'Your quiz area will open here.',
              ),
            ),

            _StudyOption(
              icon: Icons.fitness_center_rounded,
              title: 'Practice',
              subtitle: 'Practice questions whenever you want.',
              number: '05',
              onTap: () => _showComingSoon(
                context,
                'Practice',
                'Your practice workspace will open here.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(
    BuildContext context,
    String title,
    String message,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF151517),
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 5, 22, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: _orange.withOpacity(.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    color: _orangeLight,
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white54,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: _orange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Got it',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StudyOption extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String number;
  final VoidCallback onTap;

  const _StudyOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.number,
    required this.onTap,
  });

  @override
  State<_StudyOption> createState() => _StudyOptionState();
}

class _StudyOptionState extends State<_StudyOption> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => pressed = true),
      onTapCancel: () => setState(() => pressed = false),
      onTapUp: (_) {
        setState(() => pressed = false);
        widget.onTap();
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: pressed ? .975 : 1,
        child: Container(
          margin: const EdgeInsets.only(bottom: 13),
          decoration: BoxDecoration(
            color: const Color(0xFF151517),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withOpacity(.065),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 14, 15),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _orange.withOpacity(.18),
                        _orange.withOpacity(.07),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _orange.withOpacity(.10),
                    ),
                  ),
                  child: Icon(
                    widget.icon,
                    color: _orangeLight,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            widget.number,
                            style: TextStyle(
                              color: _orange.withOpacity(.45),
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white30,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
