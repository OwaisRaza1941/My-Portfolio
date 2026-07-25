import 'package:flutter/material.dart';
import 'package:portfolio/screen/desktop/desktop_home_screen.dart';
import 'package:portfolio/screen/mobile/mobile_home_screen.dart';
import 'package:portfolio/screen/tablet/tablet_home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= tabletBreakpoint) {
          return DesktopHomeScreen();
        }

        if (width >= mobileBreakpoint) {
          return TabletHomeScreen();
        }

        return MobileHomeScreen();
      },
    );
  }
}
