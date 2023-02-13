import 'package:flutter/material.dart';
import 'package:thechefz/components/home/banners.dart';
import 'package:thechefz/components/home/food_card.dart';
import 'package:thechefz/components/home/rest_card.dart';
import 'package:thechefz/components/home/rest_options.dart';
import 'package:thechefz/components/home/service_cat.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Restaurant.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({
    super.key,
    required this.controller,
    required this.pageController,
    required this.isSelect,
    required this.onChanged,
  });

  final PageController controller;
  final PageController pageController;
  final List<bool> isSelect;
  final Function onChanged;

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: ListView(
        children: [
          SizedBox(
            height: 54,
            child: TextField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                hintText: 'Search for Dishes, Restaurants, and Reservations',
                prefixIcon: Icon(
                  Icons.search,
                  color: purple,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: purple),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 160,
            child: HomeBanner(pageController: widget.controller),
          ),
          const Text(
            'Try with us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 80,
            child: ServiceCat(),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 110,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                foodCard(img: 'images/home/foodcat/winter.png', desc: 'Winter vibes'),
                SizedBox(width: 12),
                foodCard(img: 'images/home/foodcat/sweets.png', desc: 'Sweets'),
                SizedBox(width: 12),
                foodCard(img: 'images/home/foodcat/cake.png', desc: 'Cake'),
                SizedBox(width: 12),
                foodCard(img: 'images/home/foodcat/break.png', desc: 'Breakfast'),
                SizedBox(width: 12),
                foodCard(img: 'images/home/foodcat/pizza.png', desc: 'Italian'),
                SizedBox(width: 12),
                foodCard(img: 'images/home/foodcat/shawarma.png', desc: 'Shawarma'),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Chefz Nearby You',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 26,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    widget.pageController
                        .animateToPage(0, duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

                    widget.isSelect.setAll(0, [false, false, false, false]);
                    widget.isSelect[0] = !widget.isSelect[0];
                    widget.onChanged();
                  },
                  child: RestOption(
                    contcolor: widget.isSelect[0] ? purple : Colors.grey.shade300,
                    color: widget.isSelect[0] ? Colors.white : Colors.grey.shade700,
                    text: 'All',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    widget.pageController
                        .animateToPage(1, duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

                    widget.isSelect.setAll(0, [false, false, false, false]);
                    widget.isSelect[1] = !widget.isSelect[1];
                    widget.onChanged();
                  },
                  child: RestOption(
                    contcolor: widget.isSelect[1] ? purple : Colors.grey.shade300,
                    color: widget.isSelect[1] ? Colors.white : Colors.grey.shade700,
                    text: 'Delivery starts with 2 SR',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    widget.pageController
                        .animateToPage(2, duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

                    widget.isSelect.setAll(0, [false, false, false, false]);
                    widget.isSelect[2] = !widget.isSelect[2];
                    widget.onChanged();
                  },
                  child: RestOption(
                    contcolor: widget.isSelect[2] ? purple : Colors.grey.shade300,
                    color: widget.isSelect[2] ? Colors.white : Colors.grey.shade700,
                    text: 'Up to 50% off',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    widget.isSelect.setAll(0, [false, false, false, false]);
                    widget.isSelect[3] = !widget.isSelect[3];
                    widget.onChanged();
                  },
                  child: RestOption(
                    contcolor: widget.isSelect[3] ? purple : Colors.grey.shade300,
                    color: widget.isSelect[3] ? Colors.white : Colors.grey.shade700,
                    text: 'Most Popular',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 1500,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.pageController,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (var restaurant in rests) ...[
                        RestCard(
                          restaurant: restaurant,
                          fav: () {},
                          onChanged: () {
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ]
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (var restaurant in rests) ...[
                        if (restaurant.delivery2 == 'yes') ...[
                          RestCard(
                            restaurant: restaurant,
                            fav: () {},
                            onChanged: () {
                              setState(() {});
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ]
                      ]
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (var restaurant in rests) ...[
                        if (restaurant.disc == 'yes') ...[
                          RestCard(
                            restaurant: restaurant,
                            fav: () {},
                            onChanged: () {
                              setState(() {});
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ]
                      ]
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
