// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateAccountInput _$$_CreateAccountInputFromJson(
        Map<String, dynamic> json) =>
    _$_CreateAccountInput(
      hotelName: json['hotelName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_CreateAccountInputToJson(
        _$_CreateAccountInput instance) =>
    <String, dynamic>{
      'hotelName': instance.hotelName,
      'password': instance.password,
    };

_$_LoginInput _$$_LoginInputFromJson(Map<String, dynamic> json) =>
    _$_LoginInput(
      hotelName: json['hotelName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_LoginInputToJson(_$_LoginInput instance) =>
    <String, dynamic>{
      'hotelName': instance.hotelName,
      'password': instance.password,
    };
