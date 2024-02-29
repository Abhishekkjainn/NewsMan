import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsman/api/api.dart';
import 'package:newsman/controllerandModel/newsModal.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<NewsModal>> SearchNewslist;
  @override
  void initState() {
    SearchNewslist = API().getSearchNews('latest%20India');
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: SearchAppBar(),
      body: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<NewsModal>>(
                future: SearchNewslist,
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
                    SearchNewslist = Future.value([]);

                    return ListView.builder(
                      itemCount: snapshotb.data!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
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
                                        left: 15,
                                        right: 15,
                                        top: 15,
                                        bottom: 15),
                                    child: Container(
                                      width: double.maxFinite,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 85, 85, 85),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
      ),
    );
  }

  AppBar SearchAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      toolbarHeight: 100,
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      title: TextField(
        // onChanged: (value) {
        //   SearchNewslist = API().getSearchNews(value);
        // },
        controller: searchController,
        cursorColor: Colors.grey,
        cursorRadius: Radius.circular(40),
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            hintText: 'Search for your Interest',
            hintStyle: TextStyle(
                color: const Color.fromARGB(255, 67, 67, 67), fontSize: 12),
            isDense: true,
            contentPadding: EdgeInsets.only(left: 25),
            suffixIcon: IconButton(
                onPressed: () async {
                  setState(() {
                    SearchNewslist = API().getSearchNews(searchController.text);
                  });
                },
                icon: Icon(
                  CupertinoIcons.search_circle_fill,
                  color: Colors.blue,
                  size: 36,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.grey, width: 2))),
        enabled: true,
      ),
    );
  }
}
