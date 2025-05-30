import 'package:fl_clash/common/common.dart';
import 'package:flutter/material.dart';

class AuthFragment extends StatelessWidget {
  const AuthFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMaterialListPadding.copyWith(
        top: 16,
        bottom: 16,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Text(
              '欢迎来到认证页面',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
} 