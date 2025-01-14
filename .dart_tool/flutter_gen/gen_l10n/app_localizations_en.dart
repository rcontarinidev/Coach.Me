import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Entrar';

  @override
  String get loginSubtitle => 'Comida fresca entregue.';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get rememberMe => 'Lembrar-me';

  @override
  String get forgotPassword => 'Esqueceu sua senha?';

  @override
  String get loginButton => 'Entrar';

  @override
  String get registerHere => 'Cadastre-se aqui!';
}
