import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
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
  get actions => [
        ElevatedButton(
          onPressed: () {
            globalState.appController.toPage(PageLabel.order);
          },
          child: Row(
            children: [
              const Icon(Icons.add_shopping_cart),
              const SizedBox(width: 4),
              const Text("充值"),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            debouncer.call(commonDuration, () async {
              final commonScaffoldState =
                  globalState.homePageKey.currentState;
              if (commonScaffoldState?.mounted != true) return;
              await commonScaffoldState?.loadingRun(() async {
                final authProps = ref.watch(authSettingProvider);
                final result =
                    await globalState.authController.login(UserLoginProps(
                  email: authProps.email,
                  password: authProps.password,
                ));
                globalState.showMessage(
                    message: TextSpan(text: result.message));
              });
            });
          },
          icon: const Icon(
            Icons.refresh,
          ),
        ),
      ];

  @override
  void dispose() {
    super.dispose();
  }

  Widget _build(BuildContext context) {
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
              _getUserSubscriptionItem(context),
              const SizedBox(
                height: 16,
              ),
              _getTokenItem(context),
              const SizedBox(
                height: 16,
              ),
              _getDeviceInfoItem(context),
              const SizedBox(
                height: 16,
              ),
              ..._getButtonGroup(context),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffoldView(_build(context), actions, PageLabel.auth);
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

  Widget _getUserSubscriptionItem(BuildContext context) {
    final authSetting = ref.watch(authSettingProvider);
    final subscriptionInfo = authSetting.subscriptionInfo;
    final expireDate =
        DateTime.fromMillisecondsSinceEpoch(subscriptionInfo.expire);
    final expireShow =
        expireDate.isAfter(DateTime.now()) ? "专业版 至 ${expireDate.show}" : "免费";
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem(
        title: Text("套餐类型"),
        subtitle: Text(expireShow),
      ),
    );
  }

  Widget _getTokenItem(BuildContext context) {
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

  Widget _getDeviceInfoItem(BuildContext context) {
    final deviceSerialNumber = ref.watch(deviceSerialNumberProvider);
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem(
        title: Text("设备唯一码"),
        subtitle: Text(deviceSerialNumber),
      ),
    );
  }

  List<Widget> _getButtonGroup(BuildContext context) {
    final items = [
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem(
          leading: const Icon(Icons.login),
          title: Text(
            appLocalizations.navigation_login,
            textAlign: TextAlign.center,
          ),
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
            appLocalizations.navigation_register,
            textAlign: TextAlign.center,
          ),
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
              },
            );
          },
        ),
      ),
      CommonCard(
        type: CommonCardType.filled,
        radius: 18,
        child: ListItem(
          leading: const Icon(Icons.password),
          title: Text(
            "找回密码",
            textAlign: TextAlign.center,
          ),
          onTap: () async {
            await globalState.showMessage(
              message: TextSpan(text: "暂未实现"),
              afterCancel: () {},
              afterConfirm: () {},
              cancelable: false,
            );
          },
        ),
      ),
    ];

    return [
      Row(
        children: items
            .sublist(0, 2)
            .map<Widget>((item) => Flexible(child: item))
            .fill(items.length ~/ 2,
                filler: (_) => const Flexible(child: SizedBox()))
            .separated(const SizedBox(width: 18))
            .toList(),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        children: items
            .sublist(2, 4)
            .map<Widget>((item) => Flexible(child: item))
            .fill(items.length ~/ 2,
                filler: (_) => const Flexible(child: SizedBox()))
            .separated(const SizedBox(width: 18))
            .toList(),
      )
    ];
  }
}
