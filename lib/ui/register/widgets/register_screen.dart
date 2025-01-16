import 'package:coach_me/ui/core/themes/dimens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/registration_form_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(registrationFormProvider);
    final formNotifier = ref.read(registrationFormProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Dimens.of(context).loginCardMaxWidthScreen,
            minWidth: Dimens.of(context).loginCardMinWidthScreen,
          ),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(Dimens.of(context).paddingLargeScreen),
            ),
            margin: EdgeInsets.symmetric(
                horizontal: Dimens.of(context).paddingLargeScreen),
            child: Padding(
              padding: EdgeInsets.all(Dimens.of(context).paddingScreenVertical),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Ícone e Texto "Voltar"
                    if (kIsWeb)
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back,
                                color: Colors.green.shade700),
                          ),
                          Text(
                            "Voltar",
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontSize: Dimens.of(context).paddingMediumScreen,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Título da Tela
                    Text(
                      "Professor",
                      style: TextStyle(
                        fontSize: Dimens.of(context).paddingExtraLargeScreen,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Nome Completo
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nome completo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                        errorText: formState.errors['fullname'],
                      ),
                      onChanged: (value) {
                        formNotifier.updateField('fullname', value);
                      },
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // E-mail
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        prefixIcon:
                        Icon(Icons.email, color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                        errorText: formState.errors['email'],
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        formNotifier.updateField('email', value);
                      },
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Senha
                    TextFormField(
                      validator: formNotifier.validator.byField(formState.registration, 'password'),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        prefixIcon:
                        Icon(Icons.lock, color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                        errorText: formState.errors['password'],
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        formNotifier.updateField('password', value);
                      },
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Telefone
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        prefixIcon:
                        Icon(Icons.phone, color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                        errorText: formState.errors['cellphone'],
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        formNotifier.updateField('cellphone', value);
                      },
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Gênero
                   /* DropdownButtonFormField<String>(
                      value: formState.registration.gender,
                      decoration: InputDecoration(
                        labelText: "Gênero",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                        errorText: formState.errors['gender'],
                      ),
                      items: ['Masculino', 'Feminino', 'Outro']
                          .map(
                            (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          formNotifier.updateField('gender', value);
                        }
                      },
                    ),*/
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Botão Cadastrar
                    ElevatedButton(
                      onPressed: () {
                        if (formNotifier.validateForm()) {
                          // Chamar lógica para salvar no banco de dados
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cadastro realizado!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Theme.of(context).colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimens.of(context).paddingLargeScreen),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                      ),
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: Dimens.of(context).paddingLargeScreen,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    // Termos de Uso
                    TextButton(
                      onPressed: () {
                        // Lógica para exibir termos de uso
                      },
                      child: Text(
                        "Termos de Uso",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
