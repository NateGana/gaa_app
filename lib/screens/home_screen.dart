import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Full name passed from Sign-Up through route arguments
    // (null on the direct Login path, so we fall back to a generic greeting).
    final fullName = ModalRoute.of(context)?.settings.arguments as String?;
    final greeting = (fullName != null && fullName.isNotEmpty) ? 'Welcome, $fullName!' : 'Welcome!';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOut,
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(offset: Offset(0, (1 - value) * 12), child: child),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BrandLogo(),
                    OutlinedButton(
                      onPressed: () {
                        // Replace route so the user cannot return to Home after logout.
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navy,
                        side: const BorderSide(color: AppColors.border),
                        minimumSize: const Size(0, 36),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ---- Warm welcome card ----
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.peach, AppColors.beige],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'WELCOME',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.3,
                          color: AppColors.navy,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        greeting,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.navy),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "We're glad to have you here.",
                        style: TextStyle(fontSize: 14.5, color: AppColors.navy.withOpacity(0.65), height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // ---- Success card ----
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.successBg,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.successBorder),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.check, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Account Created Successfully',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.navy),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Your account is ready. You can now explore the application.',
                              style: TextStyle(fontSize: 13.5, color: AppColors.textMuted, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Quick Overview',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.navy),
                ),
                const SizedBox(height: 12),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _OverviewCard(
                          icon: Icons.badge_outlined,
                          title: 'Profile',
                          value: 'Account information',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _OverviewCard(
                          icon: Icons.check_circle_outline,
                          title: 'Status',
                          value: 'Active',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _OverviewCard(
                          icon: Icons.verified_outlined,
                          title: 'Access',
                          value: 'Available',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _OverviewCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.inputFill,
              borderRadius: BorderRadius.circular(9),
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 16, color: AppColors.primary),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.navy)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 10, color: AppColors.textMuted, height: 1.3)),
        ],
      ),
    );
  }
}
