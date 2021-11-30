import 'package:flutter/material.dart';
import 'package:netflix_app_clone/json/root_app_json.dart';
import 'package:netflix_app_clone/pages/coming_soon.dart';
import 'package:netflix_app_clone/pages/downloads_page.dart';
import 'package:netflix_app_clone/pages/home_page.dart';
import 'package:netflix_app_clone/pages/search_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        ComingSoonPage(),
        SearchPage(),
        DownloadPage(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      activeTab = index;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 15,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Icon(
                          items[index]['icon'],
                          color: activeTab == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(height: 5),
                        Text(items[index]['text'],
                            style: TextStyle(
                              color: activeTab == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
