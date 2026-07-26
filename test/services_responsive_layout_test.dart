import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/services/desktop/services_section.dart';

Future<void> _pumpAt(
  WidgetTester tester,
  double width,
  Widget child, {
  double scale = 1.0,
}) async {
  tester.view.physicalSize = Size(width, 6000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(scale)),
        child: Scaffold(body: SingleChildScrollView(child: child)),
      ),
    ),
  );
  await tester.pump(const Duration(seconds: 2));
}

void main() {
  for (final scale in [1.0, 1.1, 1.2, 1.3]) {
    for (final width in [1100.0, 1280.0, 1440.0, 1920.0]) {
      testWidgets('ServicesSection at ${width}px, scale $scale', (tester) async {
        await _pumpAt(tester, width, ServicesSection(onContact: () {}),
            scale: scale);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
