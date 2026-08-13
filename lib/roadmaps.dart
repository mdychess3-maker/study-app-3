import 'package:flutter/material.dart';

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
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                FloatingActionButton.small(
                  heroTag: 'roadmap_add',
                  backgroundColor: const Color(0xFFFF8A00),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    _showCreateOptions(context);
                  },
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
                    Icon(
                      Icons.route_outlined,
                      size: 58,
                      color: Colors.white.withOpacity(.15),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'No roadmaps yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Create a roadmap using your own structure.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white38,
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
      backgroundColor: const Color(0xFF171718),
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create roadmap',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 18),
                ListTile(
                  leading: const Icon(
                    Icons.draw_rounded,
                    color: Color(0xFFFF9D2E),
                  ),
                  title: const Text('Sketch'),
                  subtitle: const Text(
                    'Draw your roadmap manually.',
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.tune_rounded,
                    color: Color(0xFFFF9D2E),
                  ),
                  title: const Text('Options'),
                  subtitle: const Text(
                    'Build one using simple choices.',
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
