// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_errors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterErrorResponse _$RegisterErrorResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterErrorResponse(
      errors: (json['errors'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$RegisterErrorResponseToJson(
        RegisterErrorResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
