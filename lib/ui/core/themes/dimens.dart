// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  static const loginCardMinWidth = 200.0;
  static const loginCardMaxWidth = 550.0;

  static const paddingSmall = 8.0;
  static const paddingMedium = 12.0;
  static const paddingLarge = 16.0;
  static const paddingExtraLarge = 32.0;

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 20.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 24.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  double get profilePictureSize;

  double get paddingSmallScreen;
  double get paddingMediumScreen;
  double get paddingLargeScreen;
  double get paddingExtraLargeScreen;

  double get loginCardMinWidthScreen;
  double get loginCardMaxWidthScreen;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
      horizontal: paddingScreenHorizontal, vertical: paddingScreenVertical);

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        > 600 => desktop,
        _ => mobile,
      };
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  @override
  final double profilePictureSize = 64.0;

  @override
  double get paddingLargeScreen => Dimens.paddingLarge;

  @override
  double get paddingExtraLargeScreen => Dimens.paddingExtraLarge;

  @override
  double get paddingSmallScreen => Dimens.paddingSmall;

  @override
  double get paddingMediumScreen => Dimens.paddingMedium;

  const _DimensMobile();

  @override
  double get loginCardMinWidthScreen => Dimens.loginCardMinWidth;

  @override
  double get loginCardMaxWidthScreen => Dimens.loginCardMaxWidth;

}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;

  @override
  double get paddingLargeScreen => 16;

  @override
  double get paddingExtraLargeScreen => 32.0;

  const _DimensDesktop();

  @override
  double get paddingSmallScreen => 8;

  @override
  double get paddingMediumScreen => Dimens.paddingMedium;

  @override
  double get loginCardMinWidthScreen => Dimens.loginCardMinWidth;

  @override
  double get loginCardMaxWidthScreen => Dimens.loginCardMaxWidth;

}
