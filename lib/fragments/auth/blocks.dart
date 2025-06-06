import 'package:jw_clash/clash/core.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/common.dart';
import 'package:jw_clash/providers/config.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSettingView extends ConsumerWidget {
  const AuthSettingView({super.key});

  Widget _getUserEmailItem(BuildContext context, WidgetRef ref) {
    final oldEmail = ref.watch(authSettingProvider.select((state) => state.email));
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem.input(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 4,
          bottom: 4,
        ),
        title: Text(appLocalizations.userEmail),
        delegate: InputDelegate(
          title: appLocalizations.userEmail,
          value: oldEmail,
          onChanged: (value) {
            ref.read(authSettingProvider.notifier).updateState(
              (state) => state.copyWith(
                email: value ?? oldEmail,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getUserPasswordItem(BuildContext context, WidgetRef ref) {
    final oldPassword = ref.watch(authSettingProvider.select((state) => state.password));
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem.input(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 4,
          bottom: 4,
        ),
        title: Text(appLocalizations.userPassword),
        delegate: InputDelegate(
          title: appLocalizations.userPassword,
          value: oldPassword,
          onChanged: (value) {
            ref.read(authSettingProvider.notifier).updateState(
              (state) => state.copyWith(
                password: value ?? oldPassword,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getDeveloperList(BuildContext context, WidgetRef ref) {
    return generateSectionV2(
      title: appLocalizations.options,
      items: [
        ListItem(
          title: Text(appLocalizations.messageTest),
          // onTap: () {
          //   context.showNotifier(
          //     appLocalizations.messageTestTip,
          //   );
          // },
        ),
        ListItem(
          title: Text(appLocalizations.crashTest),
          // onTap: () {
          //   clashCore.clashInterface.crash();
          // },
        ),
        ListItem(
          title: Text(appLocalizations.clearData),
          // onTap: () async {
          //   await globalState.appController.handleClear();
          // },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    // final enable = ref.watch(
    //   appSettingProvider.select(
    //     (state) => state.developerMode,
    //   ),
    // );
    return SingleChildScrollView(
      padding: baseInfoEdgeInsets,
      child: Column(
        children: [
          _getUserEmailItem(context, ref),
          SizedBox(
            height: 16,
          ),
          _getUserPasswordItem(context, ref),
          // CommonCard(
          //   type: CommonCardType.filled,
          //   radius: 18,
          //   child: ListItem.switchItem(
          //     padding: const EdgeInsets.only(
          //       left: 16,
          //       right: 16,
          //       top: 4,
          //       bottom: 4,
          //     ),
          //     title: Text(appLocalizations.developerMode),
          //     delegate: SwitchDelegate(
          //       value: enable,
          //       onChanged: (value) {
          //         ref.read(appSettingProvider.notifier).updateState(
          //               (state) => state.copyWith(
          //                 developerMode: value,
          //               ),
          //             );
          //       },
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          // _getDeveloperList(context, ref)
        ],
      ),
    );
  }
}
