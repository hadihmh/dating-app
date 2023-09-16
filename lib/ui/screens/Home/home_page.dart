import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dating/domain/models/post_model.dart';
import 'package:my_dating/ui/screens/Home/widgets/post_widget.dart';
import 'package:my_dating/ui/widgets/botton_nav_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = PostModel.createDummyModel()
      .images
      .asMap()
      .entries
      .map<Widget>((item) => PostWidget(
            item: item,
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottonNavBarWidget(),
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: Stack(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
              initialPage: 0,
              aspectRatio: 2.0,
              height: height - 180,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: PostModel.createDummyModel()
                .images
                .asMap()
                .entries
                .map<Widget>((entry) {
              return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 56.0,
                    height: 3.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: (_current == entry.key
                          ? const Color(0xffFF0E73)
                          : Colors.black.withOpacity(0.7)),
                    ),
                  ));
            }).toList(),
          ),
        ),
      ]),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Color(0xff3A3A3A),
          ),
          Text(
            "목이길어슬픈기린님의 새로운 스팟",
            style: TextStyle(fontSize: 14, color: Color(0xffFCFCFC)),
          ),
        ],
      ),
      actions: [
        const Icon(
          Icons.star,
          color: Color(0xffFF0E73),
          size: 18,
        ),
        const Text(
          "323,233",
          style: TextStyle(color: Color(0xffFCFCFC), fontSize: 14),
        ),
        Image.asset(
          "assets/images/bell.png",
          scale: 1.2,
        )
      ],
    );
  }
}
