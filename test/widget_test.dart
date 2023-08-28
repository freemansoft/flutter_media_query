import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_media_query/main.dart';

// TODO: Our calculated height is about 25 pixels too long possibly because of reserved space

/// Converts the size to a DPR 1.0 size and get the correct relative sizing
/// The test canvas / web is a DPR=1.0 device
/// This only provides the expected results if we load our fonts because the
/// Ahem font is much wider than our standard font
///
/// This can be used in two ways
/// 1. accept the device physical dimensions and the DPR as calculated by the Google viewport
/// 1. Accept the logical viewport dimensions and a DPR of 1.0
Future<void> configureTesterForSize(
    WidgetTester tester, Size canvasSize, double devicePixelRatio) async {
  Size convertedSize = Size(canvasSize.width / devicePixelRatio,
      canvasSize.height / devicePixelRatio);
  await tester.binding.setSurfaceSize(convertedSize);
  tester.view.physicalSize = convertedSize;
  tester.view.devicePixelRatio = 1.0;
}

void main() {
  /// Test the pixel 3a sized device
  testWidgets('Golden Test Pixel 3a', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await configureTesterForSize(tester, const Size(1080, 2220), 2.75);
    await tester.pumpWidget(const MyApp());
    await expectLater(
        find.byType(MyApp), matchesGoldenFile('main-pixel3a-actual.png'));
  });

  /// test the much larger 4XL sized device
  testWidgets('Golden Test Pixel 4XL', (WidgetTester tester) async {
    await configureTesterForSize(tester, const Size(1440, 3040), 2.75);
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await expectLater(
        find.byType(MyApp), matchesGoldenFile('main-pixel4XL-actual.png'));
  });
}
