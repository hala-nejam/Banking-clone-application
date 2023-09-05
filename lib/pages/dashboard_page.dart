import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../data_json/balance_json.dart';
import 'card_page.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
   int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60), // ارتفاع ال appbar
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
        onPressed: () {},
        icon: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
        ),
      ),
      // --------------------
      actions: [IconButton(onPressed: () {}, icon: Icon(AntDesign.search1))],
    );
  }

// ----------------------------
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.25,
          decoration: BoxDecoration(color: primary),
          child: Column(children: [
            Container(
              width: size.width,
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(balanceLists.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: size.width * 0.7,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    balanceLists[index]['currency'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? white
                                            : white.withOpacity(0.5)),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  balanceLists[index]['amount'],
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(balanceLists[index]['description'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: white.withOpacity(0.5)))
                          ]),
                    ),
                  );
                })),
              ),
            ),
            // -------------------
             Expanded(child: Container(width: size.width,
             child: Row(children: [
              SizedBox(width: 15,),
              Flexible(
                child: Container(height: 50,
                decoration: BoxDecoration(color: secondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12)
                ),
                 child:Center(child: Text("Add money",style: TextStyle(color: white,
                 fontWeight: FontWeight.w500),),)
                  ),
              
              ),
                SizedBox(width: 15,),
                 Flexible(
                child: Container(height: 50,
                decoration: BoxDecoration(color: secondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12)
                ),
                 child:Center(child: Text("Exchange",style: TextStyle(color: white,
                 fontWeight: FontWeight.w500),),)
                  ),
              
              ),
                SizedBox(width: 15,),
             ]),))
          ]),
        ),
        // --------------------------
        Expanded(child: SingleChildScrollView(child: 
        Container(width: size.width,
        decoration: BoxDecoration(color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
        topRight: Radius.circular(25)
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 25,
          bottom: 40,left: 20,right: 20),
          child: getAcountSection(),
        ),  
        ),))
       
      ],
    );
  }
  Widget getAcountSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Accounts",style: TextStyle(fontSize: 17,
        fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),
        Container(width: double.infinity,
        decoration: BoxDecoration(color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow:[ BoxShadow(
          color: grey.withOpacity(0.1),
          spreadRadius: 10,
          blurRadius: 10
        )]
           ),
       child: Padding(
         padding: const EdgeInsets.all(18.0),
         child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Row(
                  children: [
                    Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: secondary.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Icon(
                                    AntDesign.wallet,
                                    color: primary,
                                     size: 20,
                                  ),
                                ),
                              ),
                                 SizedBox(
                            width: 15,
                          ),
                          Text(
                            "40832-810-5-7000-012345",
                            style: TextStyle(fontSize: 15),
                          )
                  ],
                ),
                       
            Icon(
                        Icons.keyboard_arrow_down,
                        color: primary,
                      )
            ],
          ),
            // --------------------------
             SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Divider(
                      thickness: 0.2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Icon(
                            MaterialIcons.euro_symbol,
                            color: primary,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "18 199.24 EUR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Divider(
                      thickness: 0.2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Icon(
                            MaterialCommunityIcons.currency_gbp,
                            color: primary,
                            size: 20,
                          ),
                        ),
                      ),
                       SizedBox(
                        width: 15,
                      ),
                      Text(
                        "36.67 GBP",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
         ])

         ]),
         
       ),
       ),
      //  ----------------------Cards-------
       SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cards",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.ios_add,
                      size: 16,
                      color: primary,
                    ),
                    Text(
                      "ADD CARD",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: primary),
                    )
                  ],
                ),
              )
            ],
          ),
          // ----------------------
        
SizedBox(
            height: 15,
          ),
             GestureDetector(    // لتنقل من صفحة لصفحة
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => CardPage()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                    // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Icon(
                              AntDesign.creditcard,
                              color: primary,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "EUR *2330",
                          style: TextStyle(
                              fontSize: 15, ),
                        )
                      ],
                    ),
                   
                   
                  //  ---------------------------
                   
                    Text(
                          "8 199.24 EUR",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      
                    
                    
                      ],
                    )
                  ],
                ),
              ),
            ),
          )

    ],);

    // -----------------------------
    

  }
}
