import 'package:coach_me/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: Dimens.of(context).paddingExtraLargeScreen,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimens.of(context).paddingSmallScreen),
                    Text(
                      "Icone do app.",
                      style: TextStyle(
                        fontSize: Dimens.of(context).paddingLargeScreen,
                        color: Colors.green.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimens.of(context).paddingExtraLargeScreen),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalization.of(context).emailLabel,
                        prefixIcon:
                            Icon(Icons.email, color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalization.of(context).passwordLabel,
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.green.shade700),
                        suffixIcon: Icon(Icons.visibility,
                            color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalization.of(context).forgotPassword,
                        style: TextStyle(color: Colors.green.shade700),
                      ),
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimens.of(context).paddingLargeScreen),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingMediumScreen),
                        ),
                      ),
                      child: Text(
                        AppLocalization.of(context).loginTitle,
                        style: TextStyle(
                            fontSize: Dimens.of(context).paddingLargeScreen,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: Dimens.of(context).paddingLargeScreen),
                    Text(
                      AppLocalization.of(context).dontHaveAnAccount,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(Routes.register);
                      },
                      child: Text(
                        AppLocalization.of(context).registerHere,
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
