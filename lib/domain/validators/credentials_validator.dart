import 'package:coach_me/domain/dtos/credentials_dto.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialsValidator extends LucidValidator<Credentials> {
  CredentialsValidator() {
    ruleFor((credentials) => credentials.email, key: 'email')
        .notEmpty()
        .validEmail();

    ruleFor((credentials) => credentials.password, key: 'password')
        .notEmpty()
        .minLength(6)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveSpecialCharacter();
  }
}
