part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegistrationDone extends RegisterState {}

final class RegistartionError extends RegisterState {
  final List<String> errorMessages;
  RegistartionError(this.errorMessages);
}

final class RegistartionIsLoading extends RegisterState {}
