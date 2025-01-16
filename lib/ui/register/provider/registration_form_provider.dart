
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/dtos/registration_dto.dart';
import '../../../domain/validators/registration_validator.dart';

final registrationFormProvider =
StateNotifierProvider<RegistrationFormController, RegistrationFormState>(
        (ref) => RegistrationFormController());

class RegistrationFormState {
  final Registration registration;
  final Map<String, String> errors;

  RegistrationFormState({
    required this.registration,
    this.errors = const {},
  });

  RegistrationFormState copyWith({
    Registration? registration,
    Map<String, String>? errors,
  }) {
    return RegistrationFormState(
      registration: registration ?? this.registration,
      errors: errors ?? this.errors,
    );
  }
}

class RegistrationFormController extends StateNotifier<RegistrationFormState> {
  final validator = RegistrationValidator();

  RegistrationFormController()
      : super(RegistrationFormState(
    registration: Registration(
      email: '',
      password: '',
      gender: '',
      fullName: '',
      cellPhone: '',
    ),
  ));

  void updateField(String fieldName, String value) {
    final updatedRegistration = state.registration;

    switch (fieldName) {
      case 'email':
        updatedRegistration.email = value;
        break;
      case 'password':
        updatedRegistration.password = value;
        break;
      case 'gender':
        updatedRegistration.gender = value;
        break;
      case 'fullname':
        updatedRegistration.fullName = value;
        break;
      case 'cellphone':
        updatedRegistration.cellPhone = value;
        break;
    }
  }

  bool validateForm() {
    final result = validator.validate(state.registration);

    if (!result.isValid) {

      final errorMap = {
        for (var exception in result.exceptions)
          exception.key: exception.message
      };

      state = state.copyWith(errors: errorMap);
      return false;
    } else {
      state = state.copyWith(errors: {});
      return true;
    }
  }
}