import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'blocks.dart';

class AuthFragment extends StatefulWidget {
  const AuthFragment({super.key});

  @override
  State<AuthFragment> createState() => _AuthFragmentState();
}

class _AuthFragmentState extends State<AuthFragment> with PageMixin {
  
  @override
  void initState() {
    super.initState();
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
        return const AuthSettingView();
      },
    ); 
  }

  @override
  void dispose() {
    super.dispose();
  }
  
}
