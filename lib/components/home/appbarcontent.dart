import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Address.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/location/location_add_page.dart';

class AppBarContent extends StatefulWidget {
  const AppBarContent({
    super.key,
  });

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  List<bool> isSelect = [];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(28, 6, 28, 6),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Delivery',
                style: TextStyle(decoration: TextDecoration.underline, fontSize: 16),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 6, 32, 6),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Pickup',
                style: TextStyle(color: purple, decoration: TextDecoration.underline, fontSize: 16),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32.0),
                ),
              ),
              builder: (context) => BottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(100.0),
                  ),
                ),
                onClosing: () {},
                builder: (context) =>
                    StatefulBuilder(builder: (BuildContext context, StateSetter setStater /*You can rename this!*/) {
                  return Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Choose delivery location',
                              style: TextStyle(fontSize: 16, color: textP),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: textP),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textP,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      if (userNow[0].id != null)
                        for (var add in Addresses) ...[
                          if (add.user_id == userNow[0].id)
                            AddressCard(
                              isSelect: isSelect,
                              add: add,
                              onChanged: () {
                                setState(() {});
                                setStater(() {});
                              },
                            ),
                        ],
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LocationAddPage(
                                          onChanged: () {
                                            setStater(() {});
                                            setState(() {});
                                          },
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: purple,
                                    radius: 16,
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.location_on,
                                        color: purple,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const Text(
                                    'Deliver to a new location',
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: textP,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  );
                }),
              ),
            );
          },
          child: Image.asset(
            'images/home/deliver.png',
            width: 80,
          ),
        )
      ],
    );
  }
}

class AddressCard extends StatelessWidget {
  final Address add;
  final isSelect;
  final Function onChanged;
  const AddressCard({super.key, required this.add, required this.isSelect, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < Addresses.length; i++) {
      isSelect.add(false);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      add.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: Text(
                        add.addressText,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    for (var loop = 0; loop < isSelect.length; loop++) {
                      isSelect[loop] = false;
                    }
                    isSelect[int.parse(add.id)] = !isSelect[int.parse(add.id)];
                    currentadd = add;
                    onChanged();
                  },
                  child: CircleAvatar(
                    backgroundColor: purple,
                    radius: 16,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: isSelect[int.parse(add.id)] ? purple : Colors.white,
                        radius: 11,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 30,
              thickness: 1.5,
            )
          ],
        ),
      ),
    );
  }
}
