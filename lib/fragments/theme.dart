// ignore_for_file: deprecated_member_use
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/providers/config.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeItem {
  final ThemeMode themeMode;
  final IconData iconData;
  final String label;

  const ThemeModeItem({
    required this.themeMode,
    required this.iconData,
    required this.label,
  });
}

class FontFamilyItem {
  final FontFamily fontFamily;
  final String label;

  const FontFamilyItem({
    required this.fontFamily,
    required this.label,
  });
}

class ThemeFragment extends StatelessWidget {
  const ThemeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 24,
        children: [
          _ThemeModeItem(),
          // _PrimaryColorItem(),
          // _PrueBlackItem(),
          // _TextScaleFactorItem(),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Widget child;
  final Info info;
  final List<Widget> actions;

  const ItemCard({
    super.key,
    required this.info,
    required this.child,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      children: [
        InfoHeader(
          info: info,
          actions: actions,
        ),
        child,
      ],
    );
  }
}

class _ThemeModeItem extends ConsumerWidget {
  const _ThemeModeItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        ref.watch(themeSettingProvider.select((state) => state.themeMode));
    List<ThemeModeItem> themeModeItems = [
      ThemeModeItem(
        iconData: Icons.auto_mode,
        label: appLocalizations.auto,
        themeMode: ThemeMode.system,
      ),
      ThemeModeItem(
        iconData: Icons.light_mode,
        label: appLocalizations.light,
        themeMode: ThemeMode.light,
      ),
      ThemeModeItem(
        iconData: Icons.dark_mode,
        label: appLocalizations.dark,
        themeMode: ThemeMode.dark,
      ),
    ];
    return ItemCard(
      info: Info(
        label: appLocalizations.themeMode,
        iconData: Icons.brightness_high,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 56,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: themeModeItems.length,
          itemBuilder: (_, index) {
            final themeModeItem = themeModeItems[index];
            return CommonCard(
              isSelected: themeModeItem.themeMode == themeMode,
              onPressed: () {
                ref.read(themeSettingProvider.notifier).updateState(
                      (state) => state.copyWith(
                        themeMode: themeModeItem.themeMode,
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Icon(themeModeItem.iconData),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        themeModeItem.label,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              width: 16,
            );
          },
        ),
      ),
    );
  }
}

