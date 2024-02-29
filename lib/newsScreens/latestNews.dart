import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newsman/api/api.dart';
import 'package:newsman/controllerandModel/newsController.dart';
import 'package:newsman/controllerandModel/newsModal.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  late Future<List<NewsModal>> indianNewslist;
  late Future<List<NewsModal>> indianNewsCarousellist;
  NewsController controller = Get.find();

  @override
  void initState() {
    indianNewslist = API().getLatestIndianNews();
    indianNewsCarousellist = API().getLatestIndianNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselBuilderLatestNews(),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20, left: 30),
            child: Text(
              'Latest News For You',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          FutureBuilder<List<NewsModal>>(
            future: indianNewslist,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.blue,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  alignment: Alignment.center,
                  child: Center(
                      child: Text(
                    'Unable to load News',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
                );
              } else {
                // return Container(
                //   height: 160,
                //   width: double.maxFinite,
                //   decoration:
                //       BoxDecoration(color: Color.fromARGB(255, 32, 32, 32)),
                // );
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: IntrinsicHeight(
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 32, 32, 32),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 15),
                                child: Container(
                                  width: double.maxFinite,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 85, 85, 85),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              snapshot.data![index].imageURL))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        snapshot.data![index].source,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        snapshot.data![index].author,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Text(
                                  snapshot.data![index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                child: Text(
                                  'Date published - ' +
                                      snapshot.data![index].publishDate
                                          .substring(0, 10),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }

  FutureBuilder<List<NewsModal>> CarouselBuilderLatestNews() {
    return FutureBuilder<List<NewsModal>>(
      future: indianNewsCarousellist,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.blue,
                strokeCap: StrokeCap.round,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.center,
            child: Center(
                child: Text(
              'Unable to load News',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CarouselSlider.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index, realIndex) {
                  return IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 25, 25, 25),
                          border: Border.all(
                              color: Color.fromARGB(255, 107, 107, 107),
                              width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Container(
                              width: double.maxFinite,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data![index].imageURL)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 5),
                            child: Text(
                              snapshot.data![index].title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    snapshot.data![index].source,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    snapshot.data![index].publishDate
                                        .substring(0, 10),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Text(
                              snapshot.data![index].description,
                              textAlign: TextAlign.justify,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    // controller.LaunchURL(
                                    // snapshot.data![index].newsURL);
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                      child: Icon(CupertinoIcons.forward),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    viewportFraction: 0.9,
                    // aspectRatio: 0.8,
                    height: 500,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    initialPage: 0,
                    autoPlayInterval: Duration(milliseconds: 8000))),
          );
        }
      },
    );
  }
}
