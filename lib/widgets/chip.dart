import 'package:jw_clash/common/color.dart';
import 'package:flutter/material.dart';

class CommonChip extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? avatar;
  final double? width;

  const CommonChip({
    super.key,
    required this.label,
    this.onPressed,
    this.avatar,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ActionChip(
        avatar: avatar,
        labelPadding: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        clipBehavior: Clip.antiAlias,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed ?? () {},
        side: BorderSide(color: Theme.of(context).dividerColor.opacity15),
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(label)],
        ),
      ),
    );
  }
}

enum CommonChipGroupType {
  spaceAround,
  spaceBetween,
}

class CommonChipGroup extends StatelessWidget {
  final List<CommonChip> chips;
  final CommonChipGroupType type;

  const CommonChipGroup({
    super.key,
    required this.chips,
    this.type = CommonChipGroupType.spaceAround,
  });

  @override
  Widget build(BuildContext context) {
    final chips = switch (type) {
      CommonChipGroupType.spaceAround => this.chips.map((e) => CommonChip(
            key: e.key,
            label: e.label,
            onPressed: e.onPressed,
            avatar: e.avatar,
            width: MediaQuery.of(context).size.width / this.chips.length - 16,
          )).toList(),
      CommonChipGroupType.spaceBetween => this.chips,
    };
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: chips,
    );
  }
}
