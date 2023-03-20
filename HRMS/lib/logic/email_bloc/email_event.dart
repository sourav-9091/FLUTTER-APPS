part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();

  void add(VerifyButtonPressed verifyButtonPressed) {}
}

class VerifyButtonPressed extends EmailEvent {
  // final String email;

  // VerifyButtonPressed({
  //   required this.email,
  // });
  VerifyButtonPressed();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginButtonPressed {}';
}
