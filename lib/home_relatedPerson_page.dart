import 'package:flutter/material.dart';
import 'package:smart_b/addDrug_page.dart';
import 'moreInformation_relatedPerson_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homeRelatedPersonPage extends StatefulWidget {
  const homeRelatedPersonPage({Key? key}) : super(key: key);

  @override
  State<homeRelatedPersonPage> createState() => _homeRelatedPersonPageState();
}

class _homeRelatedPersonPageState extends State<homeRelatedPersonPage>
    with SingleTickerProviderStateMixin {
  int _currentPageIndex = 0;
  final List _pagesBody = [
    homePageBody(),
    moreInformationRelatedPerson(),
  ];

  late final TabController controller;
  Color indicatorColor = Color(0xFF44CBB1);
  bool showBottomBar = true;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagesBody[_currentPageIndex],
      bottomNavigationBar: showBottomBar
          ? Container(
              color: Colors.white,
              child: TabBar(
                controller: controller,
                padding: EdgeInsets.only(bottom: 20.0),
                unselectedLabelColor: const Color(0xFF44CBB1),
                labelColor: const Color(0xFF44CBB1),
                indicatorColor: indicatorColor,
                indicatorSize: TabBarIndicatorSize.label,
                onTap: onTapped,
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      size: 36.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.wysiwyg,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

class homePageBody extends StatefulWidget {
  const homePageBody({Key? key}) : super(key: key);

  @override
  State<homePageBody> createState() => _homePageBodyState();
}

class _homePageBodyState extends State<homePageBody> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> adviceList = [
    Container(
      decoration: BoxDecoration(
        color: Color(0xFF44CBB1),
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 25.0, top: 25.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Drink milk daily to prevent osteoporosis and bone fractures and even help you maintain a healthy weight',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'images/milk.png',
                height: 80,
                width: 55.0,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Color(0xFF44CBB1),
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 25.0, top: 25.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Drink milk daily to prevent osteoporosis and bone fractures and even help you maintain a healthy weight',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'images/milk.png',
                height: 80,
                width: 55.0,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Color(0xFF44CBB1),
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 25.0, top: 25.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Drink milk daily to prevent osteoporosis and bone fractures and even help you maintain a healthy weight',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'images/milk.png',
                height: 80,
                width: 55.0,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          child: CarouselSlider(
            items: adviceList,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: adviceList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF44CBB1)
                      .withOpacity(_current == entry.key ? 0.9 : 0.3),
                ),
              ),
            );
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.only(left: 33.0, top: 25.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Daily Review',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              )),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(21),
            children: [
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
              DailyReview(),
            ],
          ),
        )
      ],
    ));
  }
}

class DailyReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 75.0,
      decoration: const BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 15, right: 5),
              child: Image.asset('images/pill.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Panadol',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '04:00 PM',
                style: TextStyle(fontSize: 13.0, color: Color(0xFF9B9B9B)),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Text(
              '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF9B9B9B)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              'Did you already take a pill?',
              style: TextStyle(
                fontSize: 13.0,
                color: Color(0xFF9B9B9B),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 55, left: 30),
            child: Text(
              'Right now',
              style: TextStyle(fontSize: 10.0, color: Color(0xFF9B9B9B)),
            ),
          ),
        ],
      ),
    );
  }
}
