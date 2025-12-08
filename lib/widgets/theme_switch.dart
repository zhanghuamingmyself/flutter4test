// widgets/theme_switch.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(width: 8),
        DropdownButton<ThemeMode>(
          value: themeProvider.themeMode,
          underline: const SizedBox(),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('跟随系统'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('浅色模式'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('深色模式'),
            ),
          ],
          onChanged: (ThemeMode? newMode) {
            if (newMode != null) {
              themeProvider.setThemeMode(newMode);
            }
          },
        ),
      ],
    );
  }
}

// 简化的主题切换按钮
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: themeProvider.isDarkMode
            ? const Icon(Icons.light_mode, key: ValueKey('light'))
            : const Icon(Icons.dark_mode, key: ValueKey('dark')),
      ),
      onPressed: () {
        final newMode = themeProvider.isDarkMode
            ? ThemeMode.light
            : ThemeMode.dark;
        themeProvider.setThemeMode(newMode);
      },
      tooltip: '切换主题',
    );
  }
}