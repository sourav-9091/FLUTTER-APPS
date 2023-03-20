import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:hrms/logic/auth_bloc/auth.dart';
import 'package:hrms/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }

    if (event is LoginTextChangedEvent) {
      if (EmailValidator.validate(event.emailValue) == false) {
        yield (LoginErrorState(
          error: "ENTER A VALID EMAIL ADDRESS",
        ));
      } else if (event.passwordValue.length <= 7) {
        yield (LoginErrorState(
          error: "ENTER VALID PASSWORD",
        ));
      } else {
        yield (LoginFailure(error: "error"));
      }
    }
  }
}
