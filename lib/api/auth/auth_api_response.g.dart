// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserApiResponse _$$_UserApiResponseFromJson(Map<String, dynamic> json) =>
    _$_UserApiResponse(
      success: json['success'] as bool,
      hotel: json['hotel'] == null
          ? null
          : User.fromJson(json['hotel'] as Map<String, dynamic>),
      token: json['token'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_UserApiResponseToJson(_$_UserApiResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'hotel': instance.hotel,
      'token': instance.token,
      'error': instance.error,
    };
