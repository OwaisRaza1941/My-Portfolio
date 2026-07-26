/// Centralized animation timing so motion feels consistent across the app.
class AppDurations {
  AppDurations._();

  /// Standard hover / micro-interaction transition.
  static const Duration fast = Duration(milliseconds: 200);

  /// General purpose transition for scale and color changes.
  static const Duration medium = Duration(milliseconds: 350);

  /// Entrance fade / slide animations.
  static const Duration slow = Duration(milliseconds: 700);

  /// Base delay unit used to stagger entrance animations.
  static const Duration stagger = Duration(milliseconds: 120);

  /// Glide from one section to the next when a nav item is tapped.
  static const Duration sectionScroll = Duration(milliseconds: 650);

  /// One full cycle of the floating profile image.
  static const Duration profileFloat = Duration(seconds: 4);

  /// One full cycle of the flowing background wave lines.
  static const Duration backgroundWave = Duration(seconds: 12);

  /// One full cycle of the drifting glow particles.
  static const Duration particleDrift = Duration(seconds: 18);

  /// Pulse cycle for the "available" indicator dot.
  static const Duration availabilityPulse = Duration(milliseconds: 1600);
}
