import 'package:coach_me/domain/dtos/credentials_dto.dart';
import 'package:coach_me/domain/dtos/registration_dto.dart';
import 'package:lucid_validation/lucid_validation.dart';

class RegistrationValidator extends LucidValidator<Registration> {
  RegistrationValidator() {
    ruleFor((registration) => registration.email, key: 'email')
        .notEmpty()
        .validEmail();

    ruleFor((registration) => registration.password, key: 'password')
        .notEmpty()
        .minLength(6)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveSpecialCharacter();

    ruleFor((registration) => registration.gender, key: 'gender').notEmpty();

    ruleFor((registration) => registration.fullName, key: 'fullname')
        .notEmpty();

    ruleFor((registration) => registration.cellPhone, key: 'cellphone')
    .notEmpty()
    .minLength(13);
  }
}
