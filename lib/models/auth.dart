// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth.freezed.dart';

part 'generated/auth.g.dart';

@freezed
class AuthProps with _$AuthProps {
  const factory AuthProps({
    @Default('') String username,
    @Default('') String password,
  }) = _AuthModel;

  factory AuthProps.fromJson(Map<String, dynamic> json) =>
      _$AuthPropsFromJson(json);
}
