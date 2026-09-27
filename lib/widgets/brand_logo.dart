import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// G.A.A brand mark shown on Login, Sign-Up, and Home.
///
/// Set [light] to true when placing the mark on a dark background
/// (the Login/Sign-Up hero panel). Defaults to false for light backgrounds
/// (the Home screen header).
class BrandLogo extends StatelessWidget {
  final bool light;

  const BrandLogo({super.key, this.light = false});

  @override
  Widget build(BuildContext context) {
    final markBg = light ? Colors.white : AppColors.primary;
    final markFg = light ? AppColors.primary : Colors.white;
    final wordmarkColor = light ? Colors.white : AppColors.navy;
    final dotBorder = light ? AppColors.navy : AppColors.background;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 42,
          height: 42,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: markBg,
                  borderRadius: BorderRadius.circular(11),
                ),
                alignment: Alignment.center,
                child: Text(
                  'G',
                  style: TextStyle(
                    color: markFg,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    shape: BoxShape.circle,
                    border: Border.all(color: dotBorder, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'G.A.A',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: wordmarkColor,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}
