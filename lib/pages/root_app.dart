import 'package:flutter/material.dart';
import 'package:snapchat_clone_app_ui/data/bottom_items.dart';
import 'package:snapchat_clone_app_ui/pages/stories_page.dart';
import 'package:snapchat_clone_app_ui/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: const [
        StoriesPage(),
        StoriesPage(),
        StoriesPage(),
        StoriesPage(),
        StoriesPage(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(color: black),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(iconItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      iconItems[index],
                      color: pageIndex == index ? colorItems[index] : white.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style:  TextStyle(
                          fontSize: 11,
                          color: pageIndex == index ? colorItems[index] : white.withOpacity(0.5),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
