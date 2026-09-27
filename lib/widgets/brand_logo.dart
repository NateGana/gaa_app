import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// G.A.A brand mark shown on Login, Sign-Up, and Home.
///
/// The logo artwork always sits inside its own dark badge, so it
/// reads correctly on both the dark and light app themes without
/// editing the source image. Set [light] to true when placing the
/// mark on the dark hero panel (Login/Sign-Up) so the wordmark stays
/// white; leave it false on the Home header, where the wordmark
/// follows the current theme's text color.
class BrandLogo extends StatelessWidget {
  final bool light;
  final bool compact;

  const BrandLogo({super.key, this.light = false, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    final size = compact ? 34.0 : 46.0;
    final wordmarkColor = light ? const Color(0xFFEAF6F4) : palette.textPrimary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFF06100F),
            borderRadius: BorderRadius.circular(size * 0.28),
            border: Border.all(color: palette.cyan.withOpacity(0.55), width: 1),
            boxShadow: [
              BoxShadow(color: palette.cyan.withOpacity(0.25), blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size * 0.2),
            child: Image.asset('assets/images/gaa_logo.png', fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: compact ? 10 : 12),
        Text(
          'G.A.A',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: compact ? 16 : 20,
            letterSpacing: 1.2,
            color: wordmarkColor,
          ),
        ),
      ],
    );
  }
}
