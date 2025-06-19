import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

mixin AutoDisposeNotifierMixin<T> on AutoDisposeNotifier<T> {
  set value(T value) {
    state = value;
  }

  @override
  bool updateShouldNotify(previous, next) {
    final res = super.updateShouldNotify(previous, next);
    if (res) {
      onUpdate(next);
    }
    return res;
  }

  onUpdate(T value) {}
}

mixin PageMixin<T extends StatefulWidget> on State<T> {
  List<Widget> get actions => [];
  Widget? get floatingActionButton => null;
}

