import 'package:flutter/material.dart';

const Color _orange = Color(0xFFFF8A00);
const Color _orangeLight = Color(0xFFFFA52F);

const Color _white54 = Color.fromRGBO(255, 255, 255, 0.54);
const Color _white45 = Color.fromRGBO(255, 255, 255, 0.45);
const Color _white38 = Color.fromRGBO(255, 255, 255, 0.38);
const Color _white30 = Color.fromRGBO(255, 255, 255, 0.30);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HomeHeader(),
            const SizedBox(height: 24),
            const _StreakCard(),
            const SizedBox(height: 24),
            const Text(
              "Today's goal",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            _GoalCard(
              onTap: () => _showGoalDialog(context),
            ),
            const SizedBox(height: 24),
            const _SectionTitle(title: 'Continue studying'),
            const SizedBox(height: 10),
            const _EmptyState(
              icon: Icons.pause_circle_outline_rounded,
              title: 'Nothing paused',
              subtitle: 'Paused quizzes and exams will appear here.',
            ),
            const SizedBox(height: 22),
            const _SectionTitle(title: 'Upcoming'),
            const SizedBox(height: 10),
            const _EmptyState(
              icon: Icons.event_available_rounded,
              title: 'No scheduled tasks',
              subtitle: 'Your scheduled exams and tasks will appear here.',
            ),
          ],
        ),
      ),
    );
  }

  void _showGoalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF171719),
          title: const Text('Create your first goal'),
          content: const Text(
            'Set a study goal and schedule when you want to work on it.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Later',
                style: TextStyle(color: _white54),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: _orange,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Goal scheduling will open here.'),
                  ),
                );
              },
              child: const Text('Schedule goal'),
            ),
          ],
        );
      },
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _showStreakCalendar(context),
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: _orange,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _orange.withOpacity(.25),
                  blurRadius: 18,
                ),
              ],
            ),
            child: const Icon(
              Icons.local_fire_department_rounded,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _showLeagues(context),
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: const Color(0xFF18181A),
              shape: BoxShape.circle,
              border: Border.all(
                color: _orange.withOpacity(.20),
              ),
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: Color(0xFFFFB13B),
              size: 23,
            ),
          ),
        ),
        const Spacer(),
        const Text(
          'Study App 3',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  void _showStreakCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141416),
      showDragHandle: true,
      builder: (_) {
        final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '7 Day Streak',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Your study activity',
                  style: TextStyle(color: _white54),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(days.length, (index) {
                    return Column(
                      children: [
                        Text(
                          days[index],
                          style: const TextStyle(
                            color: _white38,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: _orange.withOpacity(.16),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _orange.withOpacity(.35),
                            ),
                          ),
                          child: const Icon(
                            Icons.local_fire_department_rounded,
                            color: _orangeLight,
                            size: 19,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Keep studying every day to extend your streak.',
                  style: TextStyle(color: _white54),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLeagues(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141416),
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.emoji_events_rounded,
                  color: Color(0xFFFFB13B),
                  size: 42,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Weekly Leagues',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Earn XP through studying and climb the league.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: _white54),
                ),
                const SizedBox(height: 20),
                _LeagueRow(
                  position: 1,
                  name: 'Diamond',
                  icon: Icons.diamond_outlined,
                ),
                _LeagueRow(
                  position: 2,
                  name: 'Gold',
                  icon: Icons.workspace_premium_outlined,
                ),
                _LeagueRow(
                  position: 3,
                  name: 'Silver',
                  icon: Icons.shield_outlined,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LeagueRow extends StatelessWidget {
  final int position;
  final String name;
  final IconData icon;

  const _LeagueRow({
    required this.position,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.035),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            '#$position',
            style: const TextStyle(
              color: _white54,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 15),
          Icon(icon, color: _orangeLight),
          const SizedBox(width: 12),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF24170B),
            Color(0xFF151314),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: _orange.withOpacity(.18),
        ),
        boxShadow: [
          BoxShadow(
            color: _orange.withOpacity(.06),
            blurRadius: 28,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _orange.withOpacity(.13),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_fire_department_rounded,
              color: _orangeLight,
              size: 30,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7 Day Streak',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Keep your learning streak alive.',
                  style: TextStyle(
                    color: _white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: _white30,
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final VoidCallback onTap;

  const _GoalCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(21),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF151516).withOpacity(.90),
            borderRadius: BorderRadius.circular(21),
            border: Border.all(
              color: Colors.white.withOpacity(.07),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _orange.withOpacity(.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.flag_rounded,
                      color: _orangeLight,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your first goal',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Set a goal and schedule it.',
                          style: TextStyle(
                            color: _white45,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: _white38,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  value: 0,
                  minHeight: 7,
                  backgroundColor: Color(0xFF28282A),
                  color: _orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: const Color(0xFF121213).withOpacity(.82),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: Colors.white.withOpacity(.055),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 0),
          Icon(
            icon,
            color: _white30,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: _white38,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
