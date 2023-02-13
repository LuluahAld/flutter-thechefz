// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thechefz/constants.dart';

class OTPpage extends StatefulWidget {
  final String verificationId;
  const OTPpage({super.key, required this.verificationId});

  @override
  State<OTPpage> createState() => _OTPpageState();
}

String smsCode = '';

class _OTPpageState extends State<OTPpage> {
  bool isLoading = false;
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: purple.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'images/otp.png',
            width: 70,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Please enter the OTP sent to your mobile number',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: purple,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpInput(fieldOne, true),
            const SizedBox(
              width: 8,
            ),
            OtpInput(fieldTwo, false),
            const SizedBox(
              width: 8,
            ),
            OtpInput(fieldThree, false),
            const SizedBox(
              width: 8,
            ),
            OtpInput(fieldFour, false),
            const SizedBox(
              width: 8,
            ),
            OtpInput(fieldFive, false),
            const SizedBox(
              width: 8,
            ),
            OtpInput(fieldSix, false),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        if (isLoading) ...[
          Container(
            constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: purple,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
        ],
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 45, 20, 36),
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 14),
          ),
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            setState(() {
              smsCode =
                  fieldOne.text + fieldTwo.text + fieldThree.text + fieldFour.text + fieldFive.text + fieldSix.text;
            });
            PhoneAuthCredential credential =
                PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: smsCode);
            try {
              await FirebaseAuth.instance.signInWithCredential(credential);
              setState(() {
                isLoading = false;
              });
              Navigator.pop(context);
            } catch (e) {}
          },
          child: const Text(
            'Verify',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 40,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(),
          border: OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
