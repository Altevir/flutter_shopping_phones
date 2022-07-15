import 'package:flutter/material.dart';

import 'package:flutter_shopping_phones/models/phone.dart';
import 'package:flutter_shopping_phones/services/mock_service.dart';
import 'package:flutter_shopping_phones/widgets/custom_indicator_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  int _pageIndex = 1;
  final List<Phone> listPhones = MockService.listPhones;

  List<String> listImages = [
    'images/image_main2.png',
    'images/image_main.png',
    'images/image_main2.png',
    'images/image_main.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _pageIndex,
      viewportFraction: .53,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 28,
          ),
        ),
        title: Text(
          'Smartphones',
          style: GoogleFonts.redHatDisplay(
            color: const Color(0xff06142B),
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color(0xff06142B),
              size: 28,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: const Color(0xffF4F4FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 25,
                  bottom: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '12 GB RAM + 256 GB Storage',
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff06142B),
                          ),
                        ),
                        Text(
                          'Oneplus 9 Pro',
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff06142B),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'images/liked_icon.png',
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 226,
                child: PageView.builder(
                  itemCount: listImages.length,
                  controller: _pageController,
                  itemBuilder: (_, int index) {
                    return Image.asset(
                      listImages[index],
                    );
                  },
                  onPageChanged: (index) => setState(() {
                    _pageIndex = index;
                  }),
                ),
              ),
              Container(
                width: mediaQuerySize.width,
                height: 48,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff4481EB),
                      Color(0xff39B8FF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff4481EB),
                      offset: Offset(0, 22),
                      blurRadius: 12,
                      spreadRadius: -15,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.5,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/shopping_bag.png',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Add to cart',
                            style: GoogleFonts.redHatDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 0.5,
                        ),
                      ),
                      Text(
                        '\$799.00',
                        style: GoogleFonts.redHatDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 33),
              Container(
                alignment: Alignment.center,
                height: 8,
                width: mediaQuerySize.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listImages.length,
                  itemBuilder: (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CustomIndicatorView(
                        isSelected: index == _pageIndex,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular products',
                  style: GoogleFonts.redHatDisplay(
                    color: const Color(0xff06142B),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 204,
                width: mediaQuerySize.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listPhones.length,
                  shrinkWrap: true,
                  itemBuilder: (_, int index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        right: 17,
                        bottom: 16,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff06142B).withOpacity(0.16),
                            offset: const Offset(6, 6),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      width: 148,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'images/${listPhones[index].image}',
                                  width: 84,
                                  height: 95,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listPhones[index].name,
                                    style: GoogleFonts.redHatDisplay(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  SizedBox(
                                    height: 8,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listPhones[index].classification,
                                      itemBuilder: (_, int index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                            right: 2,
                                          ),
                                          child: Icon(
                                            Icons.star,
                                            size: 7,
                                            color: Color(0xffF9B300),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '\$ ${listPhones[index].price.toStringAsFixed(2)}',
                                style: GoogleFonts.redHatDisplay(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 28,
                            width: 28,
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff4481EB),
                                    Color(0xff39B8FF),
                                  ],
                                )),
                            child: Image.asset(
                              'images/shopping_bag.png',
                              height: 12,
                              width: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
