import 'package:flutter/material.dart';
import '../main.dart';

/// Small circular sun/moon button shown on every screen that flips
/// the app between dark mode and light mode.
///
/// Set [onDarkBackground] to true when placing it on the hero panel
/// (Login/Sign-Up), which is always dark regardless of app theme, so
/// the button keeps a light-on-dark style instead of following the
/// current theme.
class ThemeToggleButton extends StatelessWidget {
  final bool onDarkBackground;

  const ThemeToggleButton({super.key, this.onDarkBackground = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final useDarkStyle = onDarkBackground || isDark;

    return Material(
      color: (useDarkStyle ? Colors.white : Colors.black).withOpacity(useDarkStyle ? 0.18 : 0.06),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
        },
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 18,
            color: useDarkStyle ? const Color(0xFFFFCB9A) : const Color(0xFF116466),
          ),
        ),
      ),
    );
  }
}
