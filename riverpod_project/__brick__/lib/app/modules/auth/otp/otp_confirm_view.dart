import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common.dart';
import 'otp_field.dart';
import '../provider.dart';

class OtpConfirmView extends ConsumerStatefulWidget {
  const OtpConfirmView({Key? key}) : super(key: key);

  @override
  ConsumerState<OtpConfirmView> createState() => _OtpViewState();
}

class _OtpViewState extends ConsumerState<OtpConfirmView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final phoneAuthModel = ref.read(phoneAuthModelProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.lottie.ipificationTech.lottie(
              height: 200,
            ),
            OtpHeader(phoneNumber: phoneAuthModel.phone ?? ""),
            const OnlyBottomCursor(),
            const SizedBox(height: 44),
            Text(
              "Didn't receive code?",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromRGBO(62, 116, 165, 1),
              ),
            ),
            Text(
              'Resend',
              style: GoogleFonts.poppins(
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: const Color.fromRGBO(62, 116, 165, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpHeader extends StatelessWidget {
  final String phoneNumber;
  const OtpHeader({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Verification',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Enter the code sent to the number',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color.fromRGBO(133, 153, 170, 1),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          phoneNumber,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        const SizedBox(height: 64)
      ],
    );
  }
}
