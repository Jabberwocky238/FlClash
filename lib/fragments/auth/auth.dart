import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthFragment extends StatefulWidget {
  const AuthFragment({super.key});

  @override
  State<AuthFragment> createState() => _AuthFragmentState();
}

class _AuthFragmentState extends State<AuthFragment> {
  @override
  Widget build(BuildContext context) {
     List<Widget> items = [
      const TextCard(name: "用户ID", value: "1234567890"),
      const TextCard(name: "绑定邮箱", value: "1234567890"),
    ];
    return generateListView(
      items
          .separated(
            const Divider(
              height: 0,
            ),
          )
          .toList(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
}
