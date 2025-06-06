import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/fragments/proxies/common.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextCard extends StatelessWidget {
  final String name;
  final String value;

  const TextCard({
    super.key,
    required this.name,
    required this.value,
  });

  Measure get measure => globalState.measure;

  Widget _buildStringText(BuildContext context, String text) {
    return SizedBox(
        // height: measure.bodySmallHeight * 1,
        child: EmojiText(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (_, ref, child) {
            return CommonCard(
              key: key,
              enterAnimated: true,
              child: child!,
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStringText(context, name),
                // const SizedBox(
                //   width: 8,
                // ),
                _buildStringText(context, value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
