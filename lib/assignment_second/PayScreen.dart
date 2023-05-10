import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:login_tutorial/assignment_first/utils/Extensions.dart';
import 'package:login_tutorial/assignment_first/utils/Utils.dart';


class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);
  @override
  PayScreenState createState() => PayScreenState();
}

class PayScreenState extends State<PayScreen> {

  final currFormat = NumberFormat("#,##0.00", "en_US");
  List paymentOption = [];
  List curr = [];
  List people = [];
  int amount = 2350;
  double currRate = 1.0;
  var selectedValue;
  bool showCustomSheet = false;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/currency.json');
    final currList = await json.decode(response);
    final String res = await rootBundle.loadString('assets/data/paycards.json');
    final cards = await json.decode(res);
    final String res1 = await rootBundle.loadString('assets/data/peoples.json');
    final peopleData = await json.decode(res1);
    setState(() {
      paymentOption = cards;
      curr = currList;
      people = peopleData;
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
        body: Container(
          constraints: const BoxConstraints.expand(
              width:double.infinity,height: double.infinity),
          color: Colors.white70,
          child: Stack(
            children: [
              SingleChildScrollView (
                  child: Padding (
                    padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          getTopRow(),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Text(currFormat.format(amount.toDouble() / getRate()),
                            style: const TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold),),
                          getCurrencyDropDown(),
                          const Padding(padding: EdgeInsets.only(top: 40)),
                          const Text('Here are some things you can do',
                            style: TextStyle(color: Colors.black54, fontSize: 20),),
                          getPaymentGrid(),
                          const Text('Your favourites people',
                            style: TextStyle(color: Colors.black54, fontSize: 20),),
                          getPeopleGrid(false)
                        ]
                    ),
                  )
              ),
              makeCustomSelectionSheet()
            ],
          )
        )
    );
  }

  double getRate() {
    double rate = 1.0;
    if (selectedValue!=null) {
      rate = selectedValue["rate"];
    }
    return rate;
  }

  Widget getTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text('Hi Ehi,',
              style: TextStyle(color: Colors.black54, fontSize: 25),),
        IconButton(
              iconSize: 30,
              icon: const Icon(Icons.notification_add, color: Colors.black54,),
              onPressed: () {  },
            ),
      ],
    );
  }

  Widget getCurrencyDropDown() {
    if (curr.isNotEmpty) {
      return DropdownButton(
        underline: const SizedBox(),
        value: selectedValue ?? curr[0],
        items: curr.map((value) =>
            DropdownMenuItem(
              value: value,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      value["flag"],
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    value["title"],
                    style: const TextStyle(color: Colors.black54, fontSize: 25),
                  ),
                ],
              ),
            ),
        ).toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        dropdownColor: Colors.white,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
      );
    } else {
      return const Text("Loading");
    }
  }

  IconData getIcon(String id) {
    if (id == "123") {
      return Icons.payment;
    } else if (id == "124") {
      return Icons.payments_outlined;
    } else if (id == "125") {
      return Icons.book_online;
    } else {
      return Icons.wallet;
    }
  }

  Widget getPaymentGrid() {
    if (paymentOption.isNotEmpty) {
      return SizedBox (
        height: 390,
        child: GridView.count(
          physics: const ScrollPhysics(),
            padding: const EdgeInsets.only(top: 20),
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1.1,
            children: List.generate(paymentOption.length, (index) {
              return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: paymentOption[index]["bgcolor"].toString().toColor(),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(getIcon(paymentOption[index]["id"])),
                          Text(paymentOption[index]["title"], style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                          Text(paymentOption[index]["description"],
                              style: const TextStyle(color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        ],
                    ),
                  )
              );
            })
        ),
      );
    } else {
      return const Text("Loading");
    }
  }

  Widget getPeopleGrid(bool isBottomSheet) {
    if (people.isNotEmpty) {
      List outputList = isBottomSheet ?
      people.where((o) => o["id"]!=0).toList() :
      people.where((o) => o["isAdded"]).toList();
      return SizedBox(
        height: 130,
        child: GridView.count(
            padding: const EdgeInsets.only(top: 20),
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: isBottomSheet ? 9.0 : 2.0,
            childAspectRatio: 1.3,
            children: List.generate(outputList.length, (index) {
              return Center(
                  child: (outputList[index]["id"]!=0) ?
                  peopleView(outputList[index], isBottomSheet) : getAddPeopleView(outputList[index])
              );
            })
        ),
      );
    } else {
      return const Text("Loading");
    }
  }

  Widget getAddPeopleView(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.black12,
          child: IconButton(
            iconSize: 40,
            icon: const Icon(Icons.add, color: Colors.grey,),
            onPressed: () {
                setState(() {
                  showCustomSheet = !showCustomSheet;
                });
              },
          )
        ),
        const SizedBox(height: 10,),
        Text(item["name"],
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
      ],
    );
  }

  Widget peopleView(item, bool isBottomSheet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipOval(
              child: InkWell (
                onTap: () {
                  if (isBottomSheet) {
                    setState(() {
                      item["isAdded"] = !item["isAdded"];
                    });
                  }
                },
                child: Image.network(
                  item["img"],
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              )
            ),
            Positioned(
                bottom: 7,
                right: -7,
                child: ClipOval(
                  child: Image.network(item["flag"],width: 20,height: 20,fit: BoxFit.cover,),
                ),
            ),
            Visibility(
              visible: isBottomSheet ? (item["isAdded"]?true:false) : false,
              child: Positioned(
                bottom: 7,
                left: -7,
                child: ClipOval(
                  child: Image.network(Utils.greenTickUrl,width: 20,height: 20,fit: BoxFit.cover,),
                ),
              )
            )
          ],
        ),
        const SizedBox(height: 10,),
        Text(item["name"],
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
      ],
    );
  }

  void showPeopleList() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Center(
            child: getPeopleGrid(true)
          ),
        );
      },
    );
  }

  Widget makeCustomSelectionSheet() {
    return Visibility(
      visible: showCustomSheet,
      child : InkWell(
        onTap: () {
          setState(() {
            showCustomSheet = !showCustomSheet;
          });
        },
        child: Container(
          alignment: AlignmentDirectional.bottomCenter,
          width:double.infinity,
          height: double.infinity,
          color: Colors.black.withAlpha(150),
          child: InkWell (
            onTap: () {},
            child: Stack (
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 165,
                  color: Colors.white,
                  child: getPeopleGrid(true),
                ),
                Positioned (
                  bottom: 140,
                  right: 10,
                  child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            showCustomSheet = !showCustomSheet;
                          });
                        },
                      )
                  ),
                )
              ],
            ),
          )
        ),
      )
    );
  }

}
