import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class AppColors {
  static const Color primaryDark = Color(0xFF4D0E13);
  static const Color accent = Color(0xFFC8A49F);
  static const Color secondary = Color(0xFFC8A49F);
  static const Color background = Color(0xFFEEE4DA);

  static final Color surface = background;
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final headingFont = GoogleFonts.montserratTextTheme();
    final bodyFont = GoogleFonts.poppinsTextTheme();

    return MaterialApp(
      title: 'Mikaela Del Rosario | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          primary: AppColors.accent,
          secondary: AppColors.accent,
          surface: AppColors.background,
        ),
        textTheme: bodyFont.copyWith(
          displayLarge: headingFont.displayLarge,
          displayMedium: headingFont.displayMedium,
          displaySmall: headingFont.displaySmall,
          headlineLarge: headingFont.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: headingFont.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: headingFont.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          titleLarge: headingFont.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  String _lastAction = 'Tap, double-tap, or long-press the button above.';

  void _handleSingleTap() {
    const message = 'Single Tap → Exam Date: September 3, 2026';
    debugPrint(message);
    setState(() => _lastAction = message);
  }

  void _handleDoubleTap() {
    const message = 'Double Tap → Professor (ITP107): Albert Q. Alforja';
    debugPrint(message);
    setState(() => _lastAction = message);
  }

  void _handleLongPress() {
    const message = 'Long Press → Student: Mikaela Denisse J. Del Rosario';
    debugPrint(message);
    setState(() => _lastAction = message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'M. DEL ROSARIO',
          style: GoogleFonts.montserrat(
            color: AppColors.background,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _HeroSection(),
            const _AboutSection(),
            const _SkillsSection(),
            const _ProjectsSection(),
            _InteractiveSection(
              lastAction: _lastAction,
              onSingleTap: _handleSingleTap,
              onDoubleTap: _handleDoubleTap,
              onLongPress: _handleLongPress,
            ),
            const _FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryDark,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
      child: Column(
        children: [
          _GlowPulse(
            glowColor: AppColors.accent,
            circular: true,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.secondary,
                  width: 3,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.accent,
                  alignment: Alignment.center,
                  child: Text(
                    'MD',
                    style: GoogleFonts.montserrat(
                      color: AppColors.background,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Mikaela Denisse J. Del Rosario',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: AppColors.background,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Information Technology Student · Aspiring Software Developer',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.surface,
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              'I build clean, functional mobile and web applications and enjoy '
              'turning ideas into working software. This portfolio was created '
              'for ITP107 to demonstrate Flutter fundamentals.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.background.withOpacity(0.85),
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 32),
          _GlowPulse(
            glowColor: AppColors.accent,
            borderRadius: BorderRadius.circular(2),
            child: ElevatedButton(
              onPressed: () {
                Scaffold.of(context).showBottomSheet(
                  (context) => Container(
                    color: AppColors.surface,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Scroll down to explore my skills, projects, and contact details.',
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                textStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
              child: const Text('VIEW MY WORK'),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowPulse extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final bool circular;
  final BorderRadius borderRadius;

  const _GlowPulse({
    required this.child,
    required this.glowColor,
    this.circular = false,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  State<_GlowPulse> createState() => _GlowPulseState();
}

class _GlowPulseState extends State<_GlowPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _glow = Tween<double>(
      begin: 0.35,
      end: 0.85,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glow,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            shape: widget.circular
                ? BoxShape.circle
                : BoxShape.rectangle,
            borderRadius: widget.circular
                ? null
                : widget.borderRadius,
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withOpacity(
                  _glow.value * 0.55,
                ),
                blurRadius: 26,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: widget.glowColor.withOpacity(
                  _glow.value * 0.3,
                ),
                blurRadius: 48,
                spreadRadius: 4,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final Color color;

  const _SectionHeading({
    required this.title,
    this.color = AppColors.primaryDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 48,
          height: 3,
          color: AppColors.secondary,
        ),
      ],
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeading(title: 'About Me'),
          const SizedBox(height: 20),
          Card(
            color: AppColors.surface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                color: AppColors.secondary,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                'I am a third-year Information Technology student with a strong '
                'interest in application development, user interface design, and '
                'problem-solving through code. I enjoy learning new frameworks and '
                'applying them to real projects, from mobile apps to full web '
                'systems. Outside of academics, I like exploring design trends and '
                'refining how software looks and feels to use.',
                style: GoogleFonts.poppins(
                  color: AppColors.primaryDark,
                  fontSize: 14,
                  height: 1.7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillData {
  final IconData icon;
  final String name;
  final double level;
  final String note;

  const _SkillData(
    this.icon,
    this.name,
    this.level,
    this.note,
  );
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  static const List<_SkillData> skills = [
    _SkillData(
      Icons.smartphone_rounded,
      'Flutter & Dart',
      0.85,
      'Mobile app development',
    ),
    _SkillData(
      Icons.code_rounded,
      'Java & OOP',
      0.8,
      'Core programming logic',
    ),
    _SkillData(
      Icons.storage_rounded,
      'Database Design',
      0.7,
      'MySQL & data modeling',
    ),
    _SkillData(
      Icons.language_rounded,
      'Web Development',
      0.75,
      'HTML, CSS, JavaScript',
    ),
    _SkillData(
      Icons.brush_rounded,
      'UI/UX Design',
      0.8,
      'Figma & layout systems',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeading(title: 'Skills'),
          const SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 18),
            itemBuilder: (context, index) {
              final s = skills[index];

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    s.icon,
                    color: AppColors.accent,
                    size: 26,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              s.name,
                              style: GoogleFonts.montserrat(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${(s.level * 100).round()}%',
                              style: GoogleFonts.poppins(
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          s.note,
                          style: GoogleFonts.poppins(
                            color: AppColors.primaryDark
                                .withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            Container(
                              height: 6,
                              width: double.infinity,
                              color: AppColors.background,
                            ),
                            FractionallySizedBox(
                              widthFactor: s.level,
                              child: Container(
                                height: 6,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectData {
  final String title;
  final String description;
  final IconData icon;

  const _ProjectData(
    this.title,
    this.description,
    this.icon,
  );
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  static const List<_ProjectData> projects = [
    _ProjectData(
      'Budget Tracking App',
      'A personal finance app that helps users log income and expenses, set savings goals, and view simple visual spending summaries.',
      Icons.account_balance_wallet_rounded,
    ),
    _ProjectData(
      'Inventory Manager',
      'A desktop system built for a small business to track stock levels, sales, and supplier orders.',
      Icons.inventory_2_rounded,
    ),
    _ProjectData(
      'Barangay Document Request Tracker',
      'A system that lets residents request barangay documents online and track the status of each request in real time.',
      Icons.assignment_rounded,
    ),
    _ProjectData(
      'Study Planner',
      'A productivity tool with reminders and progress tracking to help students manage deadlines.',
      Icons.checklist_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: _SectionHeading(title: 'Projects'),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: projects.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final p = projects[index];

                return Container(
                  width: 240,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.secondary,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryDark
                            .withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Icon(
                        p.icon,
                        color: AppColors.accent,
                        size: 30,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        p.title,
                        style: GoogleFonts.montserrat(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          p.description,
                          style: GoogleFonts.poppins(
                            color: AppColors.primaryDark
                                .withOpacity(0.65),
                            fontSize: 12.5,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum _TapEffect {
  idle,
  tap,
  doubleTap,
  longPress,
}

class _InteractiveSection extends StatefulWidget {
  final String lastAction;
  final VoidCallback onSingleTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;

  const _InteractiveSection({
    required this.lastAction,
    required this.onSingleTap,
    required this.onDoubleTap,
    required this.onLongPress,
  });

  @override
  State<_InteractiveSection> createState() =>
      _InteractiveSectionState();
}

class _InteractiveSectionState
    extends State<_InteractiveSection> {
  _TapEffect _effect = _TapEffect.idle;
  bool _isHolding = false;
  double _spins = 0;

  void _resetAfter(Duration d) {
    Future.delayed(d, () {
      if (mounted) {
        setState(() => _effect = _TapEffect.idle);
      }
    });
  }

  void _onTap() {
    widget.onSingleTap();

    setState(() => _effect = _TapEffect.tap);

    _resetAfter(
      const Duration(milliseconds: 260),
    );
  }

  void _onDoubleTap() {
    widget.onDoubleTap();

    setState(() {
      _effect = _TapEffect.doubleTap;
      _spins += 1;
    });

    _resetAfter(
      const Duration(milliseconds: 520),
    );
  }

  void _onLongPressStart(
    LongPressStartDetails details,
  ) {
    setState(() {
      _isHolding = true;
      _effect = _TapEffect.longPress;
    });
  }

  void _onLongPressEnd(
    LongPressEndDetails details,
  ) {
    widget.onLongPress();

    setState(() => _isHolding = false);

    _resetAfter(
      const Duration(milliseconds: 260),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool holding =
        _effect == _TapEffect.longPress && _isHolding;

    final double scale = _effect == _TapEffect.tap
        ? 0.9
        : (holding ? 1.14 : 1.0);

    final Color fillColor = switch (_effect) {
      _TapEffect.tap => AppColors.primaryDark,
      _TapEffect.doubleTap => AppColors.primaryDark,
      _TapEffect.longPress => AppColors.primaryDark,
      _TapEffect.idle => AppColors.primaryDark,
    };

    const Color labelColor = AppColors.accent;

    return Container(
      width: double.infinity,
      color: AppColors.accent,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 56,
      ),
      child: Column(
        children: [
          Text(
            'Try the Interactive Button',
            style: GoogleFonts.montserrat(
              color: AppColors.primaryDark,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Each gesture has its own effect — check the Debug Console for the printed output.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.primaryDark.withOpacity(0.75),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: _onTap,
            onDoubleTap: _onDoubleTap,
            onLongPressStart: _onLongPressStart,
            onLongPressEnd: _onLongPressEnd,
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              child: AnimatedRotation(
                turns: _spins,
                duration: const Duration(milliseconds: 480),
                curve: Curves.easeInOutCubic,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: AppColors.accent,
                      width: holding ? 2.5 : 1.5,
                    ),
                    boxShadow: holding
                        ? [
                            BoxShadow(
                              color: AppColors.primaryDark
                                  .withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                  child: Text(
                    'CLICK ME',
                    style: GoogleFonts.montserrat(
                      color: labelColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: AppColors.accent,
                width: 1,
              ),
            ),
            child: Text(
              widget.lastAction,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.accent,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  void _showProfilePopup(
    BuildContext context, {
    required String platform,
    required IconData icon,
    required String value,
    bool showPhoto = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: AppColors.secondary,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showPhoto)
                ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Container(
                      width: 84,
                      height: 84,
                      color: AppColors.accent,
                      alignment: Alignment.center,
                      child: Text(
                        'MD',
                        style: GoogleFonts.montserrat(
                          color: AppColors.background,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: AppColors.primaryDark,
                    size: 30,
                  ),
                ),
              const SizedBox(height: 16),
              if (showPhoto)
                Text(
                  'Mikaela Denisse J. Del Rosario',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              if (showPhoto)
                const SizedBox(height: 4),
              Text(
                value,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.primaryDark
                      .withOpacity(0.75),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                platform,
                style: GoogleFonts.poppins(
                  color: AppColors.accent,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: value),
                      );

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            'Copied "$value" to clipboard',
                          ),
                          backgroundColor:
                              AppColors.primaryDark,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.accent,
                    ),
                    child: const Text('COPY'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          AppColors.primaryDark,
                    ),
                    child: const Text('CLOSE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryDark,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 44,
      ),
      child: Column(
        children: [
          Text(
            "Let's Connect",
            style: GoogleFonts.montserrat(
              color: AppColors.background,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: Icons.facebook,
                onTap: () => _showProfilePopup(
                  context,
                  platform: 'Facebook',
                  icon: Icons.facebook,
                  value: '@mikaela.delrosario',
                  showPhoto: true,
                ),
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                icon: Icons.camera_alt_rounded,
                onTap: () => _showProfilePopup(
                  context,
                  platform: 'Instagram',
                  icon: Icons.camera_alt_rounded,
                  value: '@mikaela.delrosario',
                  showPhoto: true,
                ),
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                icon: Icons.email_rounded,
                onTap: () => _showProfilePopup(
                  context,
                  platform: 'Email',
                  icon: Icons.email_rounded,
                  value: 'mikaela.delrosario@example.com',
                ),
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                icon: Icons.phone_rounded,
                onTap: () => _showProfilePopup(
                  context,
                  platform: 'Phone',
                  icon: Icons.phone_rounded,
                  value: '+63 917 123 4567',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            height: 1,
            color: AppColors.accent,
          ),
          const SizedBox(height: 16),
          Text(
            '© 2026 Mikaela Denisse J. Del Rosario · ITP107',
            style: GoogleFonts.poppins(
              color: AppColors.surface.withOpacity(0.7),
              fontSize: 11.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.secondary,
            width: 1.4,
          ),
        ),
        child: Icon(
          icon,
          color: AppColors.background,
          size: 20,
        ),
      ),
    );
  }
}