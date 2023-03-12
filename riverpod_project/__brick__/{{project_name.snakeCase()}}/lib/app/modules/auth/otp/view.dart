import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:universal_io/io.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../common.dart';
import '../provider.dart';

class OtpLoginView extends HookConsumerWidget {
  const OtpLoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btnController = useState(LoadingButtonController());
    final textController = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    return Form(
      key: formKey.value,
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Text.rich(
            TextSpan(
              text: "By next, you agree to our",
              children: [
                TextSpan(
                  text: " Terms of Service",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.primary,
                  ),
                ),
                const TextSpan(text: " and"),
                TextSpan(
                  text: " Privacy Policy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.primary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.3,
                  width: context.width,
                  child: Assets.rive.server.rive(
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "{{project_name.titleCase()}}",
                  textScaleFactor: 2.5,
                  style: TextStyle(
                    color: context.primary,
                    fontFamily: FontFamily.harlow,
                  ),
                ),
                SizedBox(height: context.height * 0.1),
                Text.rich(
                  TextSpan(
                    text: "We will send you a",
                    children: [
                      TextSpan(
                        text: " One Time Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.primary,
                        ),
                      ),
                      const TextSpan(
                        text: " on this mobile number",
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    logger.v(phone.completeNumber);
                    textController.text = phone.completeNumber;
                  },
                  keyboardType: Platform.isIOS
                      ? const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        )
                      : TextInputType.number,
                ),
                const SizedBox(height: 20),
                LoadingButton(
                  controller: btnController.value,
                  onPressed: () async {
                    final isValid = await validateForm(
                        formKey: formKey.value,
                        btnController: btnController.value);
                    if (isValid) {
                      final token = await ref
                          .read(userStateProvider.notifier)
                          .createPhoneSession(
                            phone: textController.text,
                            userId: ApiClient.uuid.v4(),
                          );
                      if (token != null) {
                        ref.read(phoneAuthModelProvider.notifier).state =
                            PhoneAuthModel(phone: textController.text);
                        btnController.value.success();
                        if (context.mounted) {
                          context.go('/otp-verification');
                        }
                        btnController.value.reset();
                      }
                    }
                    btnController.value.reset();
                  },
                  borderRadius: 30,
                  child: const Text(
                    "Next",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
