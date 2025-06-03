// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      token: json['token'] as String? ?? null,
      configUrl: json['configUrl'] as String? ??
          "http://secret-bg7jhf8l.jumping.config.jw238.site/",
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'token': instance.token,
      'configUrl': instance.configUrl,
    };
