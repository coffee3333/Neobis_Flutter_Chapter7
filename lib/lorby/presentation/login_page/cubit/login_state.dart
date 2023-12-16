part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginDone extends LoginState {}

final class LoginError extends LoginState {
  final List<String> errorMessages;
  LoginError(this.errorMessages);
}

final class LoginIsLoading extends LoginState {}
