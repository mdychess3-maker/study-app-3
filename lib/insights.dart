import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Insights',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Understand your learning performance.',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 24),
            const _InsightCard(
              icon: Icons.timer_outlined,
              title: 'Study time',
              value: '0h 0m',
              subtitle: 'Total recorded study time',
            ),
            const _InsightCard(
              icon: Icons.trending_up_rounded,
              title: 'Progress',
              value: '0%',
              subtitle: 'Overall learning progress',
            ),
            const _InsightCard(
              icon: Icons.quiz_outlined,
              title: 'Quiz performance',
              value: '—',
              subtitle: 'Your quiz results will appear here',
            ),
            const _InsightCard(
              icon: Icons.auto_graph_rounded,
              title: 'Subject performance',
              value: '—',
              subtitle: 'Performance by subject',
            ),
            const _InsightCard(
              icon: Icons.flag_outlined,
              title: 'Goal completion',
              value: '0%',
              subtitle: 'Goals completed',
            ),
            const _InsightCard(
              icon: Icons.warning_amber_rounded,
              title: 'Weak areas',
              value: '—',
              subtitle: 'Topics that need more attention',
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;

  const _InsightCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFF151516),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFFF8A00).withOpacity(.11),
              borderRadius: BorderRadius.circular(14),
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
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFFFF9D2E),
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
