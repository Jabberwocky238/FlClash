// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthPropsImpl _$$AuthPropsImplFromJson(Map<String, dynamic> json) =>
    _$AuthPropsImpl(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      token: json['token'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      usageAmount: (json['usageAmount'] as num?)?.toInt(),
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AuthPropsImplToJson(_$AuthPropsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'usageAmount': instance.usageAmount,
      'totalAmount': instance.totalAmount,
    };
