import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Full-width primary action button used on Login and Sign-Up.
///
/// Styled as a gradient orange "power" button with a soft glow to
/// match the premium gaming look, while keeping the same simple
/// (label, onPressed) API the screens already use.
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: [palette.orange, palette.orangeSoft],
        ),
        boxShadow: [
          BoxShadow(
            color: palette.orange.withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
                color: palette.onOrange,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
