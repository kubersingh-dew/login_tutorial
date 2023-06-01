import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_tutorial/assignment_three/datamodel/DashBoardData.dart';

import 'coreview/SearchView.dart';
import 'coreview/HotelsView.dart';
import 'coreview/BannerView.dart';
import 'coreview/PopularView.dart';
import 'coreview/ExploreView.dart';
import 'coreview/StoryView.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {

  DashBoardData? dashBoardData;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/travel_dashboard.json');
    //final currList = await json.decode(response);
    setState(() {
      dashBoardData = DashBoardData.fromJson(jsonDecode(response));
      //paymentOption = currList;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_on,
              color: Colors.black,
            ),
            onPressed: () {
              // handle search button tap
            },
          ),
        ],
        title: const Text(
          'Explore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Expanded(
          child: ListView.builder(
              itemCount: dashBoardData?.components?.length,
              itemBuilder: (_, index) {
                final componentItem = dashBoardData?.components?[index];
                if (componentItem?.type == "roundedList") {
                  return ExploreView(data: componentItem?.data ?? []);
                } else if (componentItem?.type == "searchView") {
                  return SearchView(searchText: componentItem?.title ?? "");
                } else if (componentItem?.type == "stories") {
                  return StoryView(data: componentItem?.data ?? [],);
                } else if (componentItem?.type == "popularView") {
                  return PopularView(title: componentItem?.title??"", data: componentItem?.data ?? []);
                } else if (componentItem?.type == "bannerView") {
                  return BannerView(title: componentItem?.title??"", subtitle: componentItem?.subtitle??"",
                    bannerImg: componentItem?.img??"", data: componentItem?.data??[],);
                } else if (componentItem?.type == "hotelView") {
                  return HotelsView(title: componentItem?.title??"", data: componentItem?.data ?? []);
                }
              }),
        ),
      ),
    );
  }
}