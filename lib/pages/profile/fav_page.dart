import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Restaurant.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List<bool> isSelect = [false, false];
  PageController pageController = PageController();
  @override
  void initState() {
    isSelect = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(favRest.length);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'My Favorites',
          style: TextStyle(
            color: textP,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 130,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  isSelect.setAll(0, [false, false]);
                  isSelect[0] = !isSelect[0];
                  setState(() {});
                  pageController.animateToPage(0, duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                },
                child: Column(
                  children: [
                    Text(
                      'Chefz',
                      style: TextStyle(
                        color: isSelect[0] ? textP : Colors.grey.shade500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    if (isSelect[0])
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Divider(
                          thickness: 5,
                          color: purple,
                        ),
                      ),
                    if (!isSelect[0])
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Divider(
                          thickness: 5,
                          color: Colors.transparent,
                        ),
                      ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  isSelect.setAll(0, [false, false]);
                  isSelect[1] = !isSelect[1];
                  setState(() {});
                  pageController.animateToPage(1, duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                },
                child: Column(
                  children: [
                    Text(
                      'Dishes',
                      style: TextStyle(
                        color: isSelect[1] ? textP : Colors.grey.shade500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    if (isSelect[1])
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Divider(
                          thickness: 5,
                          color: purple,
                        ),
                      ),
                    if (!isSelect[1])
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Divider(
                          thickness: 5,
                          color: Colors.transparent,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView(
              controller: pageController,
              allowImplicitScrolling: false,
              children: [
                ListView(
                  padding: const EdgeInsets.all(24),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    for (var rest in favRest) ...[
                      RestFavCard(
                        rest: rest,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ]
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Image.asset(
                      'images/meal.png',
                      width: 200,
                    ),
                    Text(
                      'No dishes favorited',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RestFavCard extends StatelessWidget {
  final Restaurant rest;
  const RestFavCard({super.key, required this.rest});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 240,
          width: 300,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(rest.img),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 44,
                  ),
                  Text(
                    rest.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(rest.rating),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(rest.distance),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(rest.cat),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 38,
          top: 106,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: purple,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: Image.asset(rest.imgl),
            ),
          ),
        ),
      ],
    );
  }
}
