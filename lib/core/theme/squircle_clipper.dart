import 'dart:ui';

import 'package:flutter/material.dart';
import 'colors.dart';

/// Squircle clip radius scale (all Avelut shapes use squircle, never circle/rect).
class SquircleRadius {
  const SquircleRadius._();

  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

/// Clipper that produces a squircle-like rounded rectangle.
/// All corners use [radius]; higher [radius] = softer squircle.
class SquircleClipper extends CustomClipper<RRect> {
  const SquircleClipper({this.radius = SquircleRadius.md});

  final double radius;

  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
  }

  @override
  bool shouldReclip(covariant SquircleClipper oldClipper) =>
      oldClipper.radius != radius;
}

/// Convenience: a container that clips its child (and its own decoration)
/// into a squircle shape.
class SquircleContainer extends StatelessWidget {
  const SquircleContainer({
    super.key,
    this.radius = SquircleRadius.md,
    this.color,
    this.decoration,
    this.border,
    this.child,
    this.clipBehavior = Clip.antiAlias,
  });

  final double radius;
  final Color? color;
  final Decoration? decoration;
  final BoxBorder? border;
  final Widget? child;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final clip = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: clipBehavior,
      child: child,
    );

    if (decoration != null || color != null || border != null) {
      return DecoratedBox(
        decoration: decoration ??
            BoxDecoration(
              color: color,
              border: border,
              borderRadius: BorderRadius.circular(radius),
            ),
        child: clip,
      );
    }

    return clip;
  }
}

/// Glassmorphic surface: blurred semi-transparent background with hairline border.
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    this.radius = SquircleRadius.md,
    this.blurSigma = 12.0,
    this.opacity = 0.08,
    this.borderOpacity = 0.12,
    this.child,
  });

  final double radius;
  final double blurSigma;
  final double opacity;
  final double borderOpacity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor =
        isDark ? AppColors.offBlackSurface.withOpacity(opacity)
            : AppColors.pureWhite.withOpacity(opacity);
    final borderColor =
        isDark ? AppColors.pureWhite.withOpacity(borderOpacity)
            : AppColors.grayDark.withOpacity(borderOpacity);

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          decoration: BoxDecoration(
            color: surfaceColor,
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
        ),
      ),
    );
  }
}
