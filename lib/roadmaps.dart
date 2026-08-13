import 'package:flutter/material.dart';

const Color _orange = Color(0xFFFF8A00);
const Color _orangeLight = Color(0xFFFFA52F);

class RoadmapsScreen extends StatelessWidget {
  const RoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Roadmaps',
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -.8,
                    ),
                  ),
                ),
                FloatingActionButton.small(
                  heroTag: 'roadmap_add',
                  elevation: 0,
                  backgroundColor: _orange,
                  foregroundColor: Colors.black,
                  onPressed: () => _showCreateOptions(context),
                  child: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Build your own learning paths.',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        color: _orange.withOpacity(.07),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _orange.withOpacity(.12),
                        ),
                      ),
                      child: const Icon(
                        Icons.route_rounded,
                        size: 42,
                        color: _orangeLight,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'No roadmaps yet',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Create your first learning path\nusing Sketch or Options.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white38,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF171719),
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 27),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create roadmap',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Choose how you want to build it.',
                  style: TextStyle(color: Colors.white45),
                ),
                const SizedBox(height: 18),
                _CreateChoice(
                  icon: Icons.draw_rounded,
                  title: 'Sketch',
                  subtitle: 'Draw your roadmap with your finger.',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const _RoadmapSketchPage(),
                      ),
                    );
                  },
                ),
                _CreateChoice(
                  icon: Icons.tune_rounded,
                  title: 'Options',
                  subtitle: 'Build a roadmap using structured choices.',
                  onTap: () {
                    Navigator.pop(context);
                    _showOptionsBuilder(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showOptionsBuilder(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF171719),
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            5,
            20,
            MediaQuery.of(context).viewInsets.bottom + 25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Build with options',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'What do you want to learn?',
                  filled: true,
                  fillColor: Colors.white.withOpacity(.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                dropdownColor: const Color(0xFF222224),
                decoration: InputDecoration(
                  labelText: 'Experience level',
                  filled: true,
                  fillColor: Colors.white.withOpacity(.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'beginner',
                    child: Text('Beginner'),
                  ),
                  DropdownMenuItem(
                    value: 'intermediate',
                    child: Text('Intermediate'),
                  ),
                  DropdownMenuItem(
                    value: 'advanced',
                    child: Text('Advanced'),
                  ),
                ],
                onChanged: (_) {},
              ),
              const SizedBox(height: 16),
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
                    'Create roadmap',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CreateChoice extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _CreateChoice({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF111113),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: _orange.withOpacity(.10),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: _orangeLight,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 11,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Colors.white30,
        ),
      ),
    );
  }
}

class _RoadmapSketchPage extends StatefulWidget {
  const _RoadmapSketchPage();

  @override
  State<_RoadmapSketchPage> createState() => _RoadmapSketchPageState();
}

class _RoadmapSketchPageState extends State<_RoadmapSketchPage> {
  final List<Offset> points = [];

  bool enhancing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0C),
      appBar: AppBar(
        title: const Text(
          'Sketch roadmap',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                points.clear();
              });
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                points.add(details.localPosition);
              });
            },
            onPanUpdate: (details) {
              setState(() {
                points.add(details.localPosition);
              });
            },
            child: CustomPaint(
              painter: _SketchPainter(points),
              size: Size.infinite,
            ),
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF171719).withOpacity(.96),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(.08),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Draw your roadmap',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Use your finger to sketch nodes and paths.',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: _orange,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: points.isEmpty
                        ? null
                        : () => _showEnhanceWarning(context),
                    icon: const Icon(Icons.auto_awesome_rounded),
                    label: const Text('AI Enhance'),
                  ),
                ],
              ),
            ),
          ),

          if (enhancing)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(.72),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: const Color(0xFF18181A),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: _orange,
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Enhancing roadmap…',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'AI is analyzing your drawing.',
                          style: TextStyle(
                            color: Colors.white45,
                          ),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              enhancing = false;
                            });
                          },
                          child: const Text('Pause'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showEnhanceWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF18181A),
          title: const Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: _orangeLight,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text('AI Enhance'),
              ),
            ],
          ),
          content: const Text(
            'Your sketch will be analyzed and converted into a polished roadmap. '
            'The enhanced result is an AI-generated image and you may not be '
            'able to edit individual roadmap elements afterward.\n\n'
            'This may use AI credits.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.45,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white54),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: _orange,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  enhancing = true;
                });
              },
              child: const Text('Enhance'),
            ),
          ],
        );
      },
    );
  }
}

class _SketchPainter extends CustomPainter {
  final List<Offset> points;

  _SketchPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _orangeLight
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (int i = 1; i < points.length; i++) {
      canvas.drawLine(
        points[i - 1],
        points[i],
        paint,
      );
    }

    final dotPaint = Paint()..color = _orange;

    for (final point in points) {
      canvas.drawCircle(point, 2.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SketchPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
