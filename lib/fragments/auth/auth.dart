import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
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
  final _authStateNotifier = ValueNotifier<AuthProps>(
    const AuthProps(),
  );

  @override
  void initState() {
    super.initState();
  }

  _initAuthState() {
    final authSetting = ref.watch(authSettingProvider);
    _authStateNotifier.value = authSetting;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initAuthState();
  }

  @override
  void dispose() {
    _authStateNotifier.dispose();
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
              _getUserEmailItem(context, ref),
              SizedBox(
                height: 16,
              ),
              _getUserPasswordItem(context, ref),
              SizedBox(
                height: 16,
              ),
              _getButtonGroup(context, ref),
            ],
          ),
        );
      },
    );
  }

  Widget _getUserEmailItem(BuildContext context, WidgetRef ref) {
    final oldEmail =
        ref.watch(authSettingProvider.select((state) => state.email));
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
            // ref.read(authSettingProvider.notifier).updateState(
            //       (state) => state.copyWith(
            //         email: value ?? oldEmail,
            //       ),
            //     );
            _authStateNotifier.value = _authStateNotifier.value.copyWith(
              email: value ?? oldEmail,
            );
          },
        ),
      ),
    );
  }

  Widget _getUserPasswordItem(BuildContext context, WidgetRef ref) {
    final oldPassword =
        ref.watch(authSettingProvider.select((state) => state.password));
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
            // ref.read(authSettingProvider.notifier).updateState(
            //       (state) => state.copyWith(
            //         password: value ?? oldPassword,
            //       ),
            //     );
            _authStateNotifier.value = _authStateNotifier.value.copyWith(
              password: value ?? oldPassword,
            );
          },
        ),
      ),
    );
  }

  Widget _getButtonGroup(BuildContext context, WidgetRef ref) {
    return CommonChipGroup(
      chips: [
        CommonChip(
          avatar: const Icon(Icons.login),
          label: appLocalizations.login,
        ),
        CommonChip(
          avatar: const Icon(Icons.person_add),
          label: appLocalizations.register,
          onPressed: () => _register(_authStateNotifier.value),
        ),
        CommonChip(
          avatar: const Icon(Icons.logout),
          label: appLocalizations.logout,
        ),
      ],
    );
  }
}

Future<void> _register(AuthProps authProps) async {
  request.post(
    "$baseUrl/register",
    {
      "email": authProps.email,
      "password": authProps.password,
    },
  );
  final value = await globalState.showCommonDialog<String>(
    child: InputDialog(
      title: appLocalizations.pleaseEnterEmailVerificationCode,
      value: "",
      suffixText: "",
      resetValue: "",
    ),
  );
  final response = await request.post(
    "$baseUrl/verify",
    {
      "email": authProps.email,
      "code": value,
    },
  );
  if (response.statusCode == 200) {
    globalState.showNotifier(appLocalizations.registerSuccess);
  }
  else if (response.statusCode == 450) {
    globalState.showNotifier(appLocalizations.registerEmailExists);
  } 
  else {
    globalState.showNotifier(appLocalizations.registerFailed);
  }
}