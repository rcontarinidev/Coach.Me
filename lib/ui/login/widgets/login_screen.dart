import 'package:coach_me/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';

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
            maxWidth: Dimens.of(context).loginCardMaxWidhtScreen,
            minWidth: Dimens.of(context).loginCardMinWidhtScreen,
          ),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Dimens.of(context).paddingScreen16),
            ),
            margin: EdgeInsets.symmetric(
                horizontal: Dimens.of(context).paddingScreen16),
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
                        fontSize: Dimens.of(context).paddingScreen32,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimens.of(context).paddingScreen8),
                    Text(
                      "Icone do app.",
                      style: TextStyle(
                        fontSize: Dimens.of(context).paddingScreen16,
                        color: Colors.green.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimens.of(context).paddingScreen32),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalization.of(context).emailLabel,
                        prefixIcon:
                            Icon(Icons.email, color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingScreen12),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Dimens.of(context).paddingScreen16),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalization.of(context).passwordLabel,
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.green.shade700),
                        suffixIcon: Icon(Icons.visibility,
                            color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingScreen12),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: Dimens.of(context).paddingScreen16),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalization.of(context).forgotPassword,
                        style: TextStyle(color: Colors.green.shade700),
                      ),
                    ),
                    SizedBox(height: Dimens.of(context).paddingScreen16),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimens.of(context).paddingScreen16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.of(context).paddingScreen12),
                        ),
                      ),
                      child: Text(
                        AppLocalization.of(context).loginTitle,
                        style: TextStyle(
                            fontSize: Dimens.of(context).paddingScreen16,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: Dimens.of(context).paddingScreen16),
                    Text(
                      AppLocalization.of(context).dontHaveAnAccount,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalization.of(context).registerHere,
                        style: TextStyle(color: Colors.green.shade700),
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
