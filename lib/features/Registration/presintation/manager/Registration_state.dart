part of 'Registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class SinupInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class SinupLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class SinupLoaded extends RegistrationState {
  RegistrationModel registrationModel;
  SinupLoaded({required this.registrationModel});

  @override
  List<Object> get props => [registrationModel];
}

class SinupError extends RegistrationState {
  String errorMessage;

  SinupError({required this.errorMessage});

  @override
  List<Object> get props => [];
}


class LoginInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends RegistrationState {
  RegistrationModel registrationModel;
  LoginLoaded({required this.registrationModel});

  @override
  List<Object> get props => [registrationModel];
}

class LoginError extends RegistrationState {
  String errorMessage;

  LoginError({required this.errorMessage});

  @override
  List<Object> get props => [];
}