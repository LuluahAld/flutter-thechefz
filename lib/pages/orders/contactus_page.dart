import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  List<bool> isSelect = [false, false];
  PageController pageController = PageController();

  @override
  void initState() {
    isSelect = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'HELP CENTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 133, 99, 130),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                Image.asset(
                  'images/contact.png',
                  width: 154,
                ),
                const Text(
                  'We are always there!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        isSelect.setAll(0, [false, false]);
                        isSelect[0] = !isSelect[0];
                        setState(() {});
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                      },
                      child: Column(
                        children: [
                          Text(
                            'Help',
                            style: TextStyle(
                              color: isSelect[0] ? Colors.white : const Color.fromARGB(255, 164, 130, 162),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          if (isSelect[0])
                            const SizedBox(
                              width: 40,
                              child: Divider(
                                thickness: 5,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    InkWell(
                      onTap: () {
                        isSelect.setAll(0, [false, false]);
                        isSelect[1] = !isSelect[1];
                        setState(() {});
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                      },
                      child: Column(
                        children: [
                          Text(
                            'History',
                            style: TextStyle(
                              color: isSelect[1] ? Colors.white : const Color.fromARGB(255, 164, 130, 162),
                              fontSize: 20,
                            ),
                          ),
                          if (isSelect[1])
                            const SizedBox(
                              width: 40,
                              child: Divider(
                                thickness: 5,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView(
              controller: pageController,
              children: [
                const HelpPageView(),
                Column(
                  children: [
                    const SizedBox(
                      height: 160,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          'images/service.png',
                          width: 120,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'No past history',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HelpPageView extends StatelessWidget {
  const HelpPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: const [
          SizedBox(
            height: 20,
          ),
          InquiryCard(
            title: 'I need help with an upcoming order',
          ),
          InquiryCard(
            title: 'I need help with a past order',
          ),
          InquiryCard(title: 'I need help with a Payment/Coupon problem'),
          InquiryCard(title: 'I need help with my reservation'),
          InquiryCard(title: 'Work with us'),
          InquiryCard(title: 'Others'),
        ],
      ),
    );
  }
}

class InquiryCard extends StatelessWidget {
  final String title;
  const InquiryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
        Divider(
          height: 50,
          thickness: 1.6,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
