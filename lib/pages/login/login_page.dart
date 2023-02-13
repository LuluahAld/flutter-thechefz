import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/components/login/background.dart';
import 'package:thechefz/components/login/mobilecard.dart';
import 'package:thechefz/pages/login/otp_page.dart';
import 'package:url_launcher/url_launcher.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final phoneNumberController = TextEditingController();

  bool buttonenabled = false;
  bool isChecked = false;
  var flag = 'images/flags/ksa.png';
  var code = '+966';
  @override
  void initState() {
    super.initState();
    buttonenabled = false;
  }

  @override
  Widget build(BuildContext context) {
    if (isChecked) {
      buttonenabled = true;
      setState(() {});
    } else {
      buttonenabled = false;
    }
    return Scaffold(
      body: Stack(
        children: [
          const backgroundimg(),
          Positioned(
            bottom: 50,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enter your mobile number',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MobileCard(
                            phoneNumberController: phoneNumberController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    isChecked = value!;
                                  },
                                );
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'I have read and accepted The Chefz ',
                                style: TextStyle(fontSize: 13),
                              ),
                              InkWell(
                                onTap: () async {
                                  final url = Uri.parse(
                                    'https://thechefz.co/en/terms/reservation/',
                                  );
                                  if (await canLaunchUrl(url)) {
                                    launchUrl(url);
                                  } else {}
                                },
                                child: const Text(
                                  'Terms and Conditions',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 220, 102, 78),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  softWrap: false,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 45, 20, 36),
                            disabledBackgroundColor: const Color.fromARGB(255, 45, 20, 36).withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 14),
                            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: buttonenabled
                            ? () async {
                                final result = await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: number,
                                  verificationCompleted: (PhoneAuthCredential credential) async {
                                    await auth.signInWithCredential(credential).then(
                                          (value) => print('Logged In Successfully'),
                                        );
                                  },
                                  verificationFailed: (FirebaseAuthException e) {
                                    print(e.message);
                                  },
                                  codeSent: (String verificationId, int? resendToken) async {
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12.0),
                                            ),
                                          ),
                                          child: OTPpage(
                                            verificationId: verificationId,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {
                                    print('TimeOut');
                                  },
                                );
                              }
                            : null,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color.fromARGB(255, 45, 20, 36);
  }
}
