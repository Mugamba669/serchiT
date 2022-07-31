import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSliderMob extends StatefulWidget {
  @override
  _ImageSliderMobState createState() => _ImageSliderMobState();
}

class _ImageSliderMobState extends State<ImageSliderMob> {
  int currentIndex = 0;

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false];
  List _isSelected = [true, false, false, false, false];

  final List<String> images = [
    'assets/images/glassdark.jpg',
    'assets/images/satfication.jpg',
    'assets/images/reward.jpg',
  ];

  final List<String> words = ['Welcome', 'Satisfaction', 'Reward'];
  final List<String> quotes = [
    'Have you lost something\n Well, go ahead and search for it. \n If you have picked an item you think was lost by someone,\n you may want to check out our reward plan',
    'The joy of finding a lost item is what motivates us everyday to find better\n and more efficient ways to connect lost items to their owners.\n *What can I say, It is fun*',
    'Get rewarded UGX.3000 for listing a lost item on Finda, that you picked when the owner searches anf finds it.\n Finda is a platform that connects individuals that have lost their items, to the people\n that have picked them up.\n Go ahead and list that item, the owner is worried, and waiting for it.'
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map((e) => Builder(builder: (context) {
              return Container(
                height: screenSize.height * 0.02,
                width: screenSize.width,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                  e,
                  fit: BoxFit.cover,
                ),
              );
            }))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            viewportFraction: 1,
            // aspectRatio: 16 / 9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 400),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
                for (int i = 0; i < imageSliders.length; i++) {
                  if (i == index) {
                    _isSelected[i] = true;
                  } else {
                    _isSelected[i] = false;
                  }
                }
              });
            },
          ),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 11,
          child: Center(
              child: Text(
            quotes[currentIndex],
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
        AspectRatio(
          aspectRatio: 13.5 / 9,
          child: Center(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width / 8,
                  right: screenSize.width / 8,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 50,
                      bottom: screenSize.height / 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < words.length; i++)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onHover: (value) {
                                  setState(() {
                                    value
                                        ? _isHovering[i] = true
                                        : _isHovering[i] = false;
                                  });
                                },
                                onTap: () {
                                  _controller.animateToPage(i);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height / 80,
                                      bottom: screenSize.height / 90),
                                  child: Text(
                                    words[i],
                                    style: TextStyle(
                                      color: _isHovering[i]
                                          ? Colors.blueGrey[900]
                                          : Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: _isSelected[i],
                                  child: AnimatedOpacity(
                                    opacity: _isSelected[i] ? 1 : 0,
                                    duration: Duration(milliseconds: 400),
                                    child: Container(
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      width: screenSize.width / 10,
                                    ),
                                  ))
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
