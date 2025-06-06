import 'package:jw_clash/common/common.dart';
import 'package:flutter/material.dart';

class CommonTheme {
  final BuildContext context;
  final Map<String, Color> _colorMap;
  final Map<String, dynamic> _measureMap;
  final double textScaleFactor;

  CommonTheme.of(
    this.context,
    this.textScaleFactor,
  ) : _colorMap = {},
      _measureMap = {};

  Color get darkenSecondaryContainer {
    return _colorMap.updateCacheValue(
      "darkenSecondaryContainer",
      () => context.colorScheme.secondaryContainer
          .blendDarken(context, factor: 0.1),
    );
  }

  Color get darkenSecondaryContainerLighter {
    return _colorMap.updateCacheValue(
      "darkenSecondaryContainerLighter",
      () => context.colorScheme.secondaryContainer
          .blendDarken(context, factor: 0.1)
          .opacity60,
    );
  }

  Color get darken2SecondaryContainer {
    return _colorMap.updateCacheValue(
      "darken2SecondaryContainer",
      () => context.colorScheme.secondaryContainer
          .blendDarken(context, factor: 0.2),
    );
  }

  Color get darken3PrimaryContainer {
    return _colorMap.updateCacheValue(
      "darken3PrimaryContainer",
      () => context.colorScheme.primaryContainer
          .blendDarken(context, factor: 0.3),
    );
  }

   Size computeTextSize(
    Text text, {
    double maxWidth = double.infinity,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text.data,
        style: text.style,
      ),
      maxLines: text.maxLines,
      textScaler: TextScaler.linear(textScaleFactor),
      textDirection: text.textDirection ?? TextDirection.ltr,
    )..layout(
        maxWidth: maxWidth,
      );
    return textPainter.size;
  }

  double get bodyMediumHeight {
    return _measureMap.updateCacheValue(
      "bodyMediumHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.bodyMedium,
        ),
      ).height,
    );
  }

  double get bodyLargeHeight {
    return _measureMap.updateCacheValue(
      "bodyLargeHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.bodyLarge,
        ),
      ).height,
    );
  }

  double get bodySmallHeight {
    return _measureMap.updateCacheValue(
      "bodySmallHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.bodySmall,
        ),
      ).height,
    );
  }

  double get labelSmallHeight {
    return _measureMap.updateCacheValue(
      "labelSmallHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.labelSmall,
        ),
      ).height,
    );
  }

  double get labelMediumHeight {
    return _measureMap.updateCacheValue(
      "labelMediumHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.labelMedium,
        ),
      ).height,
    );
  }

  double get titleLargeHeight {
    return _measureMap.updateCacheValue(
      "titleLargeHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.titleLarge,
        ),
      ).height,
    );
  }

  double get titleMediumHeight {
    return _measureMap.updateCacheValue(
      "titleMediumHeight",
      () => computeTextSize(
        Text(
          "X",
          style: context.textTheme.titleMedium,
        ),
      ).height,
    );
  }
}
