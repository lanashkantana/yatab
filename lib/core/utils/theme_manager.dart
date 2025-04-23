// lib/core/utils/theme_manager.dart
import 'package:flutter/material.dart';

/// Global notifier to switch between light and dark themes
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
