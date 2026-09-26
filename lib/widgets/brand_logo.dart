import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// G.A.A brand mark shown on Login and Home.
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.navy,
            borderRadius: BorderRadius.circular(9),
          ),
          alignment: Alignment.center,
          child: const Text(
            'GAA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 10,
              letterSpacing: 0.2,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'G.A.A',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 17,
            color: AppColors.navy,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
