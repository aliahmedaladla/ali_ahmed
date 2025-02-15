part of 'Registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class sinupEvent extends RegistrationEvent {
  final String username, email, password;
  @override
  List<Object> get props => [];
  const sinupEvent({required this.username, required this.email, required this.password});
}

class LoginEvent extends RegistrationEvent {
  final String username, password;
  @override
  List<Object> get props => [];
  const LoginEvent({required this.username, required this.password});
}
class GetLast10Product extends RegistrationEvent {
  @override
  List<Object> get props => [];
}