import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsman/api/api.dart';
import 'package:newsman/controllerandModel/newsController.dart';
import 'package:newsman/controllerandModel/newsModal.dart';

class SportsNews extends StatefulWidget {
  const SportsNews({super.key});

  @override
  State<SportsNews> createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  late Future<List<NewsModal>> sportsNewslist;
  NewsController controller = Get.find();

  @override
  void initState() {
    super.initState();
    sportsNewslist = API().getCategoryNews('sports');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20, left: 30),
              child: Text(
                'Sports News For You',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            FutureBuilder<List<NewsModal>>(
              future: sportsNewslist,
              builder: (context, snapshotb) {
                if (snapshotb.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        color: Colors.blue,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                  );
                } else if (snapshotb.hasError) {
                  return Container(
                    height: 200,
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
                  return ListView.builder(
                    itemCount: snapshotb.data!.length,
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
                                        color: const Color.fromARGB(
                                            255, 85, 85, 85),
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshotb
                                                .data![index].imageURL))),
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
                                          snapshotb.data![index].source,
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
                                          snapshotb.data![index].author,
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
                                    snapshotb.data![index].title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
