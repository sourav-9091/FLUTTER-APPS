part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  LoginTextChangedEvent({
    required this.emailValue,
    required this.passwordValue,
  });
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';
}
