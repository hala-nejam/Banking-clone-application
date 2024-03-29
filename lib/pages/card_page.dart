

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../data_json/card_json.dart';
import '../data_json/card_operations_json.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
    );
  }


Widget getAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: white,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: black,
          size: 22,
        )),
    title: Text(
      "Card",
      style: TextStyle(fontSize: 18, color: black),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: black,
            size: 25,
          ))
    ],
  );
}

// -------------------------
Widget getBody() {
var size = MediaQuery.of(context).size;
  final PageController controller = PageController();
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 240,
          child: PageView(
            controller: controller,
            children: List.generate(cardLists.length, (index) {
              return getCards(
                cardLists[index]['amount'],
                cardLists[index]['currency'],
                cardLists[index]['card_number'],
                cardLists[index]['valid_date'],
                cardLists[index]['bg_color'],
              );
            }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10
                    )
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        width: size.width / 2,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: primary, width: 3.5)),
                        ),
                        child: Center(
                          child: Text(
                            "Operations",
                            style: TextStyle(
                                fontSize: 15,
                                color: primary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    // -------------
                    Flexible(
                      child: Container(
                        width: size.width / 2,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: black.withOpacity(0.05), width: 1)),
                        ),
                        child: Center(
                          child: Text(
                            "History",
                            style: TextStyle(
                                fontSize: 15,
                                color: primary.withOpacity(0.5),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // -------------------------
              SizedBox(
                height: 20,
              ),
              Column(
                  children: List.generate(cardOperations.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 10)
                        ]),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: secondary.withOpacity(0.3),
                                      spreadRadius: 10,
                                      blurRadius: 10)
                                ]),
                            child: Center(
                                child: Icon(
                              cardOperations[index]['icon'],
                              size: 20,
                              color: primary,
                            )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            cardOperations[index]['title'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
              SizedBox(
                height: 30,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget getCards(amount, currency, card_number, valid_date, bg_color) {
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currency,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: black),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          )
        ],
      ),
      // -------------------
      SizedBox(
        height: 15,
      ),
      Container(
        width: size.width * 0.85,
        height: 170,
        decoration: BoxDecoration(
            color: bg_color, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Feather.credit_card,
                      size: 30,
                      color: white.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      card_number,
                      style: TextStyle(
                          color: white.withOpacity(0.8),
                          fontSize: 20,
                          wordSpacing: 15),
                    )
                  ],
                ),
// --------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VALID DATE",
                          style: TextStyle(
                              color: white.withOpacity(0.3), fontSize: 12),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          valid_date,
                          style: TextStyle(color: white, fontSize: 13),
                        ),
                      ],
                    ),
                    // ----------------
                    Image.asset(
                      "assets/images/master_card_logo.png",
                      width: 50,
                    )
                  ],
                )
              ]),
        ),
      )
    ],
  );
}
}