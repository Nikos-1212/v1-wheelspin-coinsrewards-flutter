import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/blocs/authentication/authentication_cubit.dart';
import 'package:test_app/repositories/repositories.dart';
import 'package:test_app/values/app_routes.dart';
import 'package:test_app/values/app_strings.dart';
import 'package:test_app/values/constants.dart';
import 'package:ui_lib/ui_components_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController =
      TextEditingController(text: "Nathanael_McCooks0725231222@mailinator.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "TestPassword123!");

  _attemptLogin() async {
    if (this._emailController.text.isEmpty == true) {
    } else if (this._passwordController.text.isEmpty == true) {
    } else {
      try {
        var repository = Repository();
        var loginResponse = await repository.login(
            _emailController.text, _passwordController.text);

        debugPrint(loginResponse.partyDetails?.accessToken);

        if(loginResponse!=null && loginResponse.partyDetails?.accessToken!= '')
        {
          final Future<SharedPreferences> _sharedPreferences =SharedPreferences.getInstance();
          final sharedPreferences = await _sharedPreferences;
          sharedPreferences.setString(AppConstants.loginResponse, json.encode(loginResponse.toJson().toString())); // setString(AppConstants.authIdToken, token);
        }

        AuthenticationCubit authenticationCubit = AuthenticationCubit();
        authenticationCubit.logIn(
            token: loginResponse.partyDetails?.accessToken ?? '',
            partyId: loginResponse.partyDetails?.partyId ?? -1,
            tenantId: loginResponse.partyDetails?.tenantId ?? -1,
            email:
                loginResponse.partyDetails?.emailAddresses?.first.value ?? '');

        Modular.to.pushReplacementNamed(AppRoutes.spinWheel);
      } catch (er) {
        debugPrint("Error: $er");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationStatus>(
      listener: (BuildContext context, state) {
        Timer(const Duration(seconds: 1), () {
          if (state == AuthenticationStatus.authenticated) {
            Modular.to.pushReplacementNamed(AppRoutes.spinWheel);
          } else {
            Modular.to.pushReplacementNamed(AppRoutes.spinWheel);
            // Modular.to.pushReplacementNamed(Modular.initialRoute);
          }
        });
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    ),
                    // onChanged: (value) {
                    //   _email = value;
                    // },
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    ),
                    // onChanged: (value) {
                    //   _password = value;
                    // },
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: VGButton.primary(
                      AppStrings.login,
                      onTap: _attemptLogin,
                      fullWidth: true,
                      buttonSize: VGButtonSize.large,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
