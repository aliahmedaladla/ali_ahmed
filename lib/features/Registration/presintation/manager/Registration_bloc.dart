import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ufuqstore/dataProviders/error/failures.dart';
import 'package:ufuqstore/features/Registration/data/model/RegistrationModel.dart';

import '../../data/repository/RegistrationRepository.dart';

part 'Registration_event.dart';
part 'Registration_state.dart';

class Registration_bloc
    extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository repository;
  Registration_bloc({required this.repository})
      : super(SinupInitial());
  @override
  Stream<RegistrationState> mapEventToState(
      RegistrationEvent event) async* {
    if (event is SinupEvent) {
      yield SinupLoading();
      final failureOrData = await repository.Sinup(event.username,event.email,event.password);

      yield* failureOrData.fold(
        (failure) async* {
          log('yield is error');
          yield SinupError(errorMessage: mapFailureToMessage(failure));
        },
        (data) async* {
          log('yield is loaded');
          yield SinupLoaded(
            registrationModel: data,
          );
        },
      );
    }
  }
}
