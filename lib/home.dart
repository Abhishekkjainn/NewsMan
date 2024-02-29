import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsman/api/api.dart';
import 'package:newsman/controllerandModel/newsModal.dart';
import 'package:newsman/newsScreens/businessNews.dart';
import 'package:newsman/newsScreens/entertainmentNews.dart';
import 'package:newsman/newsScreens/healthNews.dart';
import 'package:newsman/newsScreens/latestNews.dart';
import 'package:newsman/newsScreens/scienceNews.dart';
import 'package:newsman/newsScreens/sportsNews.dart';
import 'package:newsman/newsScreens/technologyNews.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List screens = <Widget>[
    const LatestNews(),
    const BusinessNews(),
    const TechnologyNews(),
    const SportsNews(),
    const EntertainmentNews(),
    const ScienceNews(),
    const HealthNews(),
  ];
  int mainIndex = 0;
  late Future<List<NewsModal>> indianNewslist;
  late Future<List<NewsModal>> globalNewslist;
  late Future<List<NewsModal>> buisnessNewslist;
  late Future<List<NewsModal>> entertainmentNewslist;
  late Future<List<NewsModal>> generalNewslist;
  late Future<List<NewsModal>> healthNewslist;
  late Future<List<NewsModal>> scienceNewslist;
  late Future<List<NewsModal>> sportsNewslist;
  late Future<List<NewsModal>> techNewslist;

  @override
  void initState() {
    // indianNewslist = API().getLatestIndianNews();
    // GlobalNews = API().getLatestGlobalNews();
    // BuisnessNews = API().getCategoryNews('business');
    // EntertainmentNews = API().getCategoryNews('entertainment');
    // GeneralNews = API().getCategoryNews('general');
    // HealthNews = API().getCategoryNews('health');
    // ScienceNews = API().getCategoryNews('science');
    // SportsNews = API().getCategoryNews('sports');
    // TechNews = API().getCategoryNews('technology');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          leadingWidth: 0,
          toolbarHeight: 50,
          title: categoryAppBar()),
      body: screens[mainIndex],
    );
  }

  Padding categoryAppBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.maxFinite,
        height: 40,
        decoration: BoxDecoration(color: Colors.transparent),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 0) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 0)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Latest',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 1) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 1)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Business',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 2;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 2) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 2)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Technology',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 3;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 3) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 3)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Sports',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 4;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 4) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 4)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Entertainment',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 5;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 5) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 5)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Science',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3, left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mainIndex = 6;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          (mainIndex == 6) ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: (mainIndex == 6)
                              ? Colors.blue
                              : Color.fromARGB(255, 105, 105, 105),
                          width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 5, bottom: 5),
                    child: Text(
                      'Health',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar mainAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      leading: Icon(
        Icons.newspaper_rounded,
        color: Colors.blue,
      ),
      title: Text(
        'Informer News',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ))
      ],
    );
  }
}
