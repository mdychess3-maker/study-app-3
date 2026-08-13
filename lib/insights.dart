import 'package:flutter/material.dart';

const Color _orange = Color(0xFFFF8A00);
const Color _orangeLight = Color(0xFFFFA52F);

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

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
              'Insights',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w900,
                letterSpacing: -.8,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'See how your learning is progressing.',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 22),

            const _StudyGraph(),

            const SizedBox(height: 18),

            const _StudyTimeSummary(),

            const SizedBox(height: 18),

            _InsightGrid(
              children: const [
                _SmallInsight(
                  icon: Icons.trending_up_rounded,
                  title: 'Progress',
                  value: '0%',
                ),
                _SmallInsight(
                  icon: Icons.quiz_outlined,
                  title: 'Quiz performance',
                  value: '—',
                ),
                _SmallInsight(
                  icon: Icons.menu_book_rounded,
                  title: 'Subject performance',
                  value: '—',
                ),
                _SmallInsight(
                  icon: Icons.flag_outlined,
                  title: 'Goal completion',
                  value: '0%',
                ),
              ],
            ),

            const SizedBox(height: 18),

            const _WideInsight(
              icon: Icons.warning_amber_rounded,
              title: 'Weak areas',
              subtitle: 'Topics needing more attention will appear here.',
              value: '—',
            ),

            const SizedBox(height: 16),

            _FirstGoalCard(
              onTap: () => _showGoalCreator(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showGoalCreator(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF151517),
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create your first goal',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Choose what you want to accomplish and schedule it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Goal name',
                    filled: true,
                    fillColor: Colors.white.withOpacity(.045),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: _orange,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Schedule goal',
                      style: TextStyle(fontWeight: FontWeight.w800),
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

class _StudyGraph extends StatelessWidget {
  const _StudyGraph();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(17, 17, 17, 13),
      decoration: BoxDecoration(
        color: const Color(0xFF141416),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(.065),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Study activity',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),
              Text(
                'Last 7 days',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CustomPaint(
              painter: _GraphPainter(),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 7),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mon', style: _AxisStyle()),
              Text('Tue', style: _AxisStyle()),
              Text('Wed', style: _AxisStyle()),
              Text('Thu', style: _AxisStyle()),
              Text('Fri', style: _AxisStyle()),
              Text('Sat', style: _AxisStyle()),
              Text('Sun', style: _AxisStyle()),
            ],
          ),
        ],
      ),
    );
  }
}

class _GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(.055)
      ..strokeWidth = 1;

    final linePaint = Paint()
      ..color = _orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = _orange.withOpacity(.08)
      ..style = PaintingStyle.fill;

    const rows = 4;

    for (int i = 0; i <= rows; i++) {
      final y = size.height * i / rows;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    final points = [
      Offset(size.width * .00, size.height * .86),
      Offset(size.width * .16, size.height * .72),
      Offset(size.width * .32, size.height * .78),
      Offset(size.width * .48, size.height * .48),
      Offset(size.width * .64, size.height * .58),
      Offset(size.width * .80, size.height * .27),
      Offset(size.width * .96, size.height * .34),
    ];

    final line = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      line.lineTo(points[i].dx, points[i].dy);
    }

    final fill = Path.from(line)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();

    canvas.drawPath(fill, fillPaint);
    canvas.drawPath(line, linePaint);

    for (final point in points) {
      canvas.drawCircle(
        point,
        4,
        Paint()..color = _orangeLight,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AxisStyle extends StatelessWidget {
  final String text;

  const _AxisStyle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white30,
        fontSize: 10,
      ),
    );
  }
}

class _StudyTimeSummary extends StatelessWidget {
  const _StudyTimeSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _orange.withOpacity(.13),
            const Color(0xFF151517),
          ],
        ),
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: _orange.withOpacity(.13),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.timer_outlined,
            color: _orangeLight,
            size: 30,
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Studied',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '0h 0m',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'This week',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightGrid extends StatelessWidget {
  final List<Widget> children;

  const _InsightGrid({required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.35,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}

class _SmallInsight extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SmallInsight({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF151517),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: Colors.white.withOpacity(.055),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: _orangeLight,
            size: 22,
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _WideInsight extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String value;

  const _WideInsight({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFF151517),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(.055),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: _orange.withOpacity(.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: _orangeLight,
            ),
          ),
          const SizedBox(width: 13),
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
                const SizedBox(height: 4),
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
              color: _orangeLight,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _FirstGoalCard extends StatelessWidget {
  final VoidCallback onTap;

  const _FirstGoalCard({required this.onTap});

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
            gradient: LinearGradient(
              colors: [
                _orange.withOpacity(.16),
                _orange.withOpacity(.04),
              ],
            ),
            borderRadius: BorderRadius.circular(21),
            border: Border.all(
              color: _orange.withOpacity(.15),
            ),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.flag_rounded,
                color: _orangeLight,
                size: 29,
              ),
              SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create your first goal',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Schedule it and start tracking your progress.',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white38,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
