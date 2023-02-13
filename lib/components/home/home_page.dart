import 'package:flutter/material.dart';
import 'package:thechefz/components/home/appbarcontent.dart';
import 'package:thechefz/components/home/home_page_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const AppBarContent(),
      ),
      body: HomePageContent(
        controller: widget.controller,
        pageController: widget.pageController,
        isSelect: widget.isSelect,
        onChanged: () {
          setState(() {});
        },
      ),
    );
  }
}
