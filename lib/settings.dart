import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const _ProfileHeader(),
            const SizedBox(height: 25),
            const Text(
              'Account',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            _SettingsTile(
              icon: Icons.login_rounded,
              title: 'Login',
              subtitle: 'Open an existing account',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.person_add_alt_1_rounded,
              title: 'Create account',
              subtitle: 'Create a new account',
              onTap: () {},
            ),
            const SizedBox(height: 18),
            const Text(
              'Personalization',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            _SettingsTile(
              icon: Icons.face_retouching_natural_rounded,
              title: 'Character',
              subtitle: 'Customize your 2D character',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.palette_outlined,
              title: 'Appearance',
              subtitle: 'Customize the app appearance',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.emoji_events_outlined,
              title: 'Achievements',
              subtitle: 'View unlocked and locked achievements',
              onTap: () {},
            ),
            const SizedBox(height: 18),
            const Text(
              'Tools',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            _SettingsTile(
              icon: Icons.auto_awesome_rounded,
              title: 'AI Assistant',
              subtitle: 'Chat, analyze and get help',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.document_scanner_outlined,
              title: 'AI Scanner',
              subtitle: 'Analyze images and documents',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.picture_as_pdf_outlined,
              title: 'PDF Tools',
              subtitle: 'PDF reader and editor tools',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.build_outlined,
              title: 'Tools',
              subtitle: 'Additional study utilities',
              onTap: () {},
            ),
            const SizedBox(height: 18),
            const Text(
              'App',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            _SettingsTile(
              icon: Icons.workspace_premium_outlined,
              title: 'Premium',
              subtitle: 'Explore premium features',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.new_releases_outlined,
              title: "What's new",
              subtitle: 'Latest updates and features',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.info_outline_rounded,
              title: 'App version',
              subtitle: 'Study App 3 • Version 1.0.0',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF151516),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF8A00),
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 40,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Level 1 • 0 XP',
                  style: TextStyle(
                    color: Colors.white54,
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
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      child: Material(
        color: const Color(0xFF141415),
        borderRadius: BorderRadius.circular(17),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(17),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 13,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFFFF9D2E),
                  size: 23,
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
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white30,
                  size: 21,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
