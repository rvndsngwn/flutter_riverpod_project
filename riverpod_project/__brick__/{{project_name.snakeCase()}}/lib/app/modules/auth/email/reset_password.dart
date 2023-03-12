import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../common.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  final String? userId;
  final String? secret;
  final String? expire;
  const ResetPasswordView({
    this.userId,
    this.secret,
    this.expire,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();
  bool isShowing = false;
  bool isShowing2 = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _password,
                obscureText: isShowing ? false : true,
                decoration: InputDecoration(
                  hintText: 'Enter your password.',
                  labelText: 'password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        isShowing ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isShowing = !isShowing;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your password';
                  } else if (value.isNotEmpty && value.length < 8) {
                    return 'minimum 8 characters required';
                  }

                  return null;
                },
                onSaved: (newValue) {},
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _rePassword,
                obscureText: isShowing2 ? false : true,
                decoration: InputDecoration(
                  hintText: 'Confirm your password',
                  labelText: 'confirm password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        isShowing2 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isShowing2 = !isShowing2;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm your password';
                  } else if (value.length < 8) {
                    return 'minimum 8 characters required';
                  } else if (_password.text != _rePassword.text) {
                    logger.d('password didn\'t match');
                    return 'password didn\'t match';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() == true) {
                    _formKey.currentState?.save();
                    if (_password.text == _rePassword.text) {
                      logger.d('${_password.text} ${_rePassword.text}');
                      final Token token =
                          await ApiClient.account.updateRecovery(
                        userId: widget.userId ?? '',
                        secret: widget.secret ?? '',
                        password: _password.text,
                        passwordAgain: _rePassword.text,
                      );
                      logger.i(token.toMap());
                    } else {
                      logger.d('password not match');
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Reset Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
