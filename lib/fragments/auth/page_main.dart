import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
              _getUserDebugItem(context),
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
        title: Text(appLocalizations.userEmail),
        subtitle: Text(currentEmail),
      ),
    );
  }

  Widget _getUserDebugItem(BuildContext context) {
    final currentToken =
        ref.watch(authSettingProvider.select((state) => state.token));
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem(
        title: Text("Token"),
        subtitle: Text(currentToken ?? ""),
      ),
    );
  }

  Widget _getButtonGroup(BuildContext context) {
    final items = [
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem(
          leading: const Icon(Icons.login),
          title: Text(
            appLocalizations.login,
            textAlign: TextAlign.center,
          ),
          // delegate: NextDelegate(
          //   title: appLocalizations.login,
          //   widget: PageLogin(),
          // ),
          onTap: () {
            globalState.appController.toPage(PageLabel.login);
          },
        ),
      ),
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem(
          leading: const Icon(Icons.person_add),
          title: Text(
            appLocalizations.register,
            textAlign: TextAlign.center,
          ),
          // delegate: OpenDelegate(
          //   title: appLocalizations.register,
          //   widget: PageRegister(),
          // ),
          onTap: () {
            globalState.appController.toPage(PageLabel.register);
          },
        ),
      ),
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem(
          leading: const Icon(Icons.logout),
          title: Text(
            appLocalizations.logout,
            textAlign: TextAlign.center,
          ),
          onTap: () async {
             await globalState.showMessage(
              message: TextSpan(text: "确定退出登录吗？"),
              title: appLocalizations.logout,
              afterCancel: () {},
              afterConfirm: () async {
                await globalState.authController.logout();
                commonPrint.log("logout");
              },
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
