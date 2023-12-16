import 'package:json_annotation/json_annotation.dart';

part 'register_errors_model.g.dart';

@JsonSerializable()
class RegisterErrorResponse {
  late Map<String, List<String>>? errors;

  RegisterErrorResponse({required this.errors});

  factory RegisterErrorResponse.fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) {
        // Обработка случая, когда json равен null
        return RegisterErrorResponse(errors: {});
      }
      return _$RegisterErrorResponseFromJson(json);
    } catch (e) {
      return RegisterErrorResponse(errors: {});
    }
  }

  Map<String, dynamic> toJson() => _$RegisterErrorResponseToJson(this);
}
