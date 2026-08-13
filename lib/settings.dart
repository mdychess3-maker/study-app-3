import 'package:flutter/material.dart';

const Color _orange = Color(0xFFFF8A00);
const Color _orangeLight = Color(0xFFFFA52F);

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              'Profile',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w900,
                letterSpacing: -.8,
              ),
            ),
            const SizedBox(height: 20),

            _ProfileHeader(
              onTap: () => _showAccountChoice(context),
            ),

            const SizedBox(height: 23),

            const _SectionLabel('Account'),
            _SettingsTile(
              icon: Icons.login_rounded,
              title: 'Login',
              subtitle: 'Open an existing account',
              onTap: () => _showLogin(context),
            ),
            _SettingsTile(
              icon: Icons.person_add_alt_1_rounded,
              title: 'Create account',
              subtitle: 'Create a new account',
              onTap: () => _showCreateAccount(context),
            ),

            const SizedBox(height: 18),

            const _SectionLabel('Personalization'),
            _SettingsTile(
              icon: Icons.face_retouching_natural_rounded,
              title: 'Character',
              subtitle: 'Customize your 2D character',
              onTap: () => _showCharacter(context),
            ),
            _SettingsTile(
              icon: Icons.palette_outlined,
              title: 'Appearance',
              subtitle: 'Customize the app appearance',
              onTap: () => _showAppearance(context),
            ),
            _SettingsTile(
              icon: Icons.emoji_events_outlined,
              title: 'Achievements',
              subtitle: 'View locked and unlocked achievements',
              onTap: () => _showAchievements(context),
            ),

            const SizedBox(height: 18),

            const _SectionLabel('Tools'),
            _SettingsTile(
              icon: Icons.auto_awesome_rounded,
              title: 'AI Assistant',
              subtitle: 'Chat, analyze and get study help',
              onTap: () => _showToolMessage(
                context,
                'AI Assistant',
                'Your AI study chat will open here.',
              ),
            ),
            _SettingsTile(
              icon: Icons.document_scanner_outlined,
              title: 'AI Scanner',
              subtitle: 'Scan images using camera or gallery',
              onTap: () => _showScanner(context),
            ),
            _SettingsTile(
              icon: Icons.picture_as_pdf_outlined,
              title: 'PDF Tools',
              subtitle: 'Read, edit and work with PDFs',
              onTap: () => _showToolMessage(
                context,
                'PDF Tools',
                'PDF reader and editor tools will open here.',
              ),
            ),
            _SettingsTile(
              icon: Icons.note_add_outlined,
              title: 'Create Documents',
              subtitle: 'Create a new document',
              onTap: () => _showToolMessage(
                context,
                'Create Documents',
                'Document creation will open here.',
              ),
            ),
            _SettingsTile(
              icon: Icons.edit_document,
              title: 'Edit Documents',
              subtitle: 'Edit an existing document',
              onTap: () => _showToolMessage(
                context,
                'Edit Documents',
                'Document editing will open here.',
              ),
            ),
            _SettingsTile(
              icon: Icons.manage_search_rounded,
              title: 'Analyze Documents',
              subtitle: 'Analyze documents and extract useful information',
              onTap: () => _showToolMessage(
                context,
                'Analyze Documents',
                'Document analysis will open here.',
              ),
            ),

            const SizedBox(height: 18),

            const _SectionLabel('App'),
            _SettingsTile(
              icon: Icons.workspace_premium_outlined,
              title: 'Premium',
              subtitle: 'Explore premium features',
              onTap: () => _showPremium(context),
            ),
            _SettingsTile(
              icon: Icons.new_releases_outlined,
              title: "What's new",
              subtitle: 'Latest updates and features',
              onTap: () => _showToolMessage(
                context,
                "What's new",
                'Study App 3 is getting better with every update.',
              ),
            ),
            _SettingsTile(
              icon: Icons.info_outline_rounded,
              title: 'App version',
              subtitle: 'Study App 3 • Version 3.7.21',
              onTap: () => _showToolMessage(
                context,
                'Study App 3',
                'Version 3.7.21',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAccountChoice(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF171719),
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 18),
                _BottomAction(
                  icon: Icons.login_rounded,
                  title: 'Login',
                  onTap: () {
                    Navigator.pop(context);
                    _showLogin(context);
                  },
                ),
                _BottomAction(
                  icon: Icons.person_add_alt_1_rounded,
                  title: 'Create account',
                  onTap: () {
                    Navigator.pop(context);
                    _showCreateAccount(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogin(BuildContext context) {
    _accountDialog(
      context,
      title: 'Login',
      description: 'Open your existing Study App account.',
      button: 'Login',
    );
  }

  void _showCreateAccount(BuildContext context) {
    _accountDialog(
      context,
      title: 'Create account',
      description: 'Create a new account and sync your study progress.',
      button: 'Create account',
    );
  }

  void _accountDialog(
    BuildContext context, {
    required String title,
    required String description,
    required String button,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF18181A),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white.withOpacity(.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
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
              onPressed: () => Navigator.pop(context),
              child: Text(button),
            ),
          ],
        );
      },
    );
  }

  void _showCharacter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF151517),
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _CharacterPreview(),
                const SizedBox(height: 15),
                const Text(
                  '2D Character',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Customize your character with different looks, items and poses.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: _CustomizationButton(
                        icon: Icons.face_rounded,
                        title: 'Face',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _CustomizationButton(
                        icon: Icons.content_cut_rounded,
                        title: 'Hair',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _CustomizationButton(
                        icon: Icons.checkroom_rounded,
                        title: 'Items',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAppearance(BuildContext context) {
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
                  'Appearance',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Some appearance options can be premium.',
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 18),
                _AppearanceRow(
                  title: 'Orange accent',
                  selected: true,
                  premium: false,
                ),
                _AppearanceRow(
                  title: 'Glass intensity',
                  selected: false,
                  premium: false,
                ),
                _AppearanceRow(
                  title: 'Premium themes',
                  selected: false,
                  premium: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAchievements(BuildContext context) {
    final achievements = [
      ('First Step', Icons.flag_rounded, false),
      ('7 Day Streak', Icons.local_fire_department_rounded, false),
      ('100 Cards', Icons.style_rounded, true),
      ('Quiz Master', Icons.quiz_rounded, true),
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF151517),
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Achievements',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 15),
                ...achievements.map(
                  (achievement) => ListTile(
                    onTap: () {
                      _showAchievementInfo(
                        context,
                        achievement.$1,
                        achievement.$2,
                        achievement.$3,
                      );
                    },
                    leading: Stack(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: _orange.withOpacity(.10),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            achievement.$2,
                            color: achievement.$3
                                ? Colors.white24
                                : _orangeLight,
                          ),
                        ),
                        if (achievement.$3)
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.lock_rounded,
                              size: 15,
                              color: Colors.white54,
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      achievement.$1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      achievement.$3 ? 'Locked' : 'Unlocked',
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white30,
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

  void _showAchievementInfo(
    BuildContext context,
    String name,
    IconData icon,
    bool locked,
  ) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF18181A),
          title: Text(name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 55,
                color: locked ? Colors.white24 : _orangeLight,
              ),
              const SizedBox(height: 15),
              Text(
                locked
                    ? 'This achievement is still locked.'
                    : 'Achievement unlocked.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white54),
              ),
              if (!locked) ...[
                const SizedBox(height: 7),
                const Text(
                  'Unlocked today',
                  style: TextStyle(
                    color: _orangeLight,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showScanner(BuildContext context) {
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
                  'AI Scanner',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Scan an image from your gallery or camera, then chat with AI about it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 18),
                _BottomAction(
                  icon: Icons.photo_library_outlined,
                  title: 'Choose from gallery',
                  onTap: () => Navigator.pop(context),
                ),
                _BottomAction(
                  icon: Icons.camera_alt_outlined,
                  title: 'Use camera',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPremium(BuildContext context) {
    _showToolMessage(
      context,
      'Premium',
      'Premium will unlock selected character, appearance and future features.',
    );
  }

  void _showToolMessage(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF18181A),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white54,
              height: 1.4,
            ),
          ),
          actions: [
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: _orange,
                foregroundColor: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final VoidCallback onTap;

  const _ProfileHeader({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(23),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient
