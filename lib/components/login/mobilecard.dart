import 'package:flutter/material.dart';

var number;

class MobileCard extends StatefulWidget {
  final phoneNumberController;
  const MobileCard({super.key, required this.phoneNumberController});

  @override
  State<MobileCard> createState() => _MobileCardState();
}

class _MobileCardState extends State<MobileCard> {
  static var flag = 'images/flags/ksa.png';
  static var code = '+966';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 208, 207, 207),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 4, 16),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: const EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListBody(
                            children: [
                              const Text(
                                'Select a country',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              CountriesRow(
                                coden: '+966',
                                flagimg: 'images/flags/ksa.png',
                                countryName: 'Saudi Arabia',
                                onSelect: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CountriesRow(
                                coden: '+973',
                                flagimg: 'images/flags/bah.png',
                                countryName: 'Bahrain',
                                onSelect: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CountriesRow(
                                coden: '+965',
                                flagimg: 'images/flags/kuw.png',
                                countryName: 'Kuwait',
                                onSelect: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CountriesRow(
                                coden: '+968',
                                flagimg: 'images/flags/om.png',
                                countryName: 'Oman',
                                onSelect: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CountriesRow(
                                coden: '+971',
                                flagimg: 'images/flags/uae.png',
                                countryName: 'United Arab Emirates',
                                onSelect: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CountriesRow(
                                coden: '+962',
                                flagimg: 'images/flags/jor.png',
                                countryName: 'Jordan',
                                onSelect: () {
                                  setState(() {});
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    flag,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    code,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 64,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.phoneNumberController,
              decoration: const InputDecoration(
                hintText: 'Mobile Number',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                number = '${_MobileCardState.code}$value';
                print(number);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CountriesRow extends StatelessWidget {
  const CountriesRow(
      {super.key, required this.coden, required this.flagimg, required this.countryName, required this.onSelect});
  final Function onSelect;
  final String coden;
  final flagimg;
  final countryName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _MobileCardState.code = coden;
        _MobileCardState.flag = flagimg;
        onSelect();
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Image.asset(
            flagimg,
            width: 40,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            countryName,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            coden,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
