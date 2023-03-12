import 'dart:async';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../common.dart';
import '../provider.dart';

class EmailVerifyView extends ConsumerStatefulWidget {
  final String? secret;
  final String? userId;

  const EmailVerifyView({
    Key? key,
    this.secret,
    this.userId,
  }) : super(key: key);

  @override
  ConsumerState<EmailVerifyView> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends ConsumerState<EmailVerifyView> {
  late Timer timer;
  String email = '';

  @override
  void initState() {
    if (widget.userId != null && widget.secret != null) {
      ApiClient.account
          .updateVerification(
            secret: widget.secret!,
            userId: widget.userId!,
          )
          .then((value) => checkEmailVerified());
    }
    Future.delayed(
      Duration.zero,
      () => ApiClient.account.get().then(
            (value) => setState(() => email = value.email),
          ),
    );
    timer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      await checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
          onPressed: () => context.go(RouteKey.emailLogin),
          color: context.primary,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Assets.rive.mailSend.rive(),
          ),
          const SizedBox(height: 10),
          Assets.mohesu.mohesu.image(
            width: 150,
            height: 50,
            fit: BoxFit.cover,
          ),
          CustomContainer(
            color: context.cardColor,
            blurRadius: 1,
            radius: 24,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: Text.rich(
              TextSpan(
                text: "An email has been sent to ",
                children: [
                  TextSpan(
                    text: email,
                    style: TextStyle(
                      color: context.primary,
                    ),
                  ),
                  const TextSpan(
                    text: ", please check your email and verify.",
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
            ),
          ),
          CustomContainer(
            color: context.cardColor,
            blurRadius: 1,
            radius: 24,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: const Text(
              "If you don't see the email, please check your spam folder.",
              textScaleFactor: 1.2,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                child: const Text("Resend"),
                onPressed: () async {
                  Token token = await ApiClient.account.createVerification(
                      url: "mohesu://mohesu.com${RouteKey.emailVerify}");
                  logger.d(token.toMap());
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                child: const Text("Continue"),
                onPressed: () async {
                  await checkEmailVerified();
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    ref.read(userStateProvider.notifier).getCurrentUser().then((value) {
      if (value != null) {
        timer.cancel();
        context.go(RouteKey.home);
      }
    });
  }
}
