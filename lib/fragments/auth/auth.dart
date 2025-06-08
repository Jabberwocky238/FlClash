import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'page_login.dart';
import 'page_register.dart';

class AuthFragment extends ConsumerStatefulWidget {
  const AuthFragment({super.key});

  @override
  ConsumerState<AuthFragment> createState() => _AuthFragmentState();
}

class _AuthFragmentState extends ConsumerState<AuthFragment> with PageMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        ref.listenManual(
          isCurrentPageProvider(
            PageLabel.auth,
            handler: (pageLabel) => pageLabel == PageLabel.auth,
          ),
          (prev, next) {
            if (prev != next && next == true) {
              initPageState();
            }
          },
          fireImmediately: true,
        );
        return SingleChildScrollView(
          padding: baseInfoEdgeInsets,
          child: Column(
            children: [
              _getUserEmailItem(context),
              const SizedBox(
                height: 16,
              ),
              _getButtonGroup(context),
            ],
          ),
        );
      },
    );
  }

  Widget _getUserEmailItem(BuildContext context) {
    final currentEmail =
        ref.watch(authSettingProvider.select((state) => state.email));
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 4,
          bottom: 4,
        ),
        title: Text(appLocalizations.userEmail),
        subtitle: Text(currentEmail),
      ),
    );
  }

  Widget _getButtonGroup(BuildContext context) {
    final items = [
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem.open(
          leading: const Icon(Icons.login),
          title: Text(appLocalizations.login, textAlign: TextAlign.center,),
          delegate: OpenDelegate(
            title: appLocalizations.login,
            widget: PageLogin(),
          ),
        ),
      ),
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem.open(
          leading: const Icon(Icons.person_add),
          title: Text(appLocalizations.register, textAlign: TextAlign.center,),
          delegate: OpenDelegate(
            title: appLocalizations.register,
            widget: PageRegister(),
          ),
        ),
      ),
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem(
          leading: const Icon(Icons.logout),
          title: Text(appLocalizations.logout, textAlign: TextAlign.center,),
          onTap: () {
            ref.read(authSettingProvider.notifier).updateState(
              (state) => const AuthProps(email: '', password: ''),
            );
          },
        ),
      ),
    ];

    return Row(
      children: items
          .map<Widget>((item) => Flexible(child: item))
          .fill(items.length, filler: (_) => const Flexible(child: SizedBox()))
          .separated(const SizedBox(width: 18))
          .toList(),
    );
  }
}
