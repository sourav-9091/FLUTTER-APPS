part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {}

class EmailVerifiacationLoading extends EmailState {}

class EmailVerificationLoadedSuccess extends EmailState {}

class EmailVerificationLoadedFail extends EmailState {}