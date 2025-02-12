part of 'Registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}


class SinupEvent extends RegistrationEvent {
  final String username;
  final String email;
  final String password;

  @override
  List<Object> get props => [];
  const SinupEvent ({required this.username ,required this.email , required this.password});
}

class LoginEvent extends RegistrationEvent {
  final String username;
  final String password;

  @override
  List<Object> get props => [];
  const LoginEvent ({required this.username, required this.password});
}

class GetLast10Registration extends RegistrationEvent {
  @override
  List<Object> get props => [];
}
