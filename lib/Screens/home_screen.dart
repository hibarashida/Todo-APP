import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import '../constants/myWidget.dart';
import '../constants/mycolors.dart';
import '../provider/mainprovider.dart';
import 'add_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton:
          Consumer<MainProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          backgroundColor: tViloet,
          child: Icon(Icons.add, color: cWhite, size: 38),
          onPressed: () {
            value.clear();
            callNext(context, AddList(from: "NEW", oldid: ""));
          },
        );
      }),
      backgroundColor: tViloet,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: tViloet,
        centerTitle: true,
        title: text(
          "Todo List",
          FontWeight.w700,
          cWhite,
          18,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: lightWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child:  Column(
          children: [
            SizedBox(height: 15,),
            Consumer<MainProvider>(builder: (context, value, child) {
              return value.getloader
                  ? Center(
                      child: CircularProgressIndicator(
                      color: tViloet,
                    ))
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.detailsList.length,
                        itemBuilder: (context, index) {
                          var item = value.detailsList[index];
                          return InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                        "Do you want to  EDIT or DELETE ?",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: cBlack)),
                                    actions: <Widget>[
                                      Center(
                                        child: Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                value.deletedetails(item.id);
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0x26000000),
                                                        blurRadius:
                                                            2.0, // soften the shadow
                                                        spreadRadius:
                                                            1.0, //extend the shadow
                                                      ),
                                                    ]),
                                                child: Center(
                                                    child: Text("Delete",
                                                        style: TextStyle(
                                                            color: cWhite,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700))),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                print("dbjhbd"+item.id);
                                                value.editdetails(item.id);
                                                callNext(
                                                    context,
                                                    AddList(
                                                      from: "EDIT",
                                                      oldid: item.id,
                                                    ));
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    color: tViloet,
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0x26000000),
                                                        blurRadius:
                                                            2.0, // soften the shadow
                                                        spreadRadius:
                                                            1.0, //extend the shadow
                                                      ),
                                                    ]),
                                                child: Center(
                                                    child: Text("Edit",
                                                        style: TextStyle(
                                                            color: cWhite,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700))),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                width: width,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: cWhite,
                                ),
                                child:  Row(
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("  NAME : ",
                                            style: TextStyle(
                                                color:tViloet ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w700)),
                                        Text("  PHONE NUMBER  : ",
                                            style: TextStyle(
                                                color:tViloet ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w700)),Text("  AGE : ",
                                            style: TextStyle(
                                                color:tViloet ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w700)),Text("  ADDRESS : ",
                                            style: TextStyle(
                                                color:tViloet ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w700)),
                                      ],
                                    ),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(item.name,
                                            style: TextStyle(
                                                color:cGrey ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w400)),
                                        Text(item.phonenumber,
                                            style: TextStyle(
                                                color:cGrey ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w400)),Text(item.age,
                                            style: TextStyle(
                                                color:cGrey ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w400)),Text(item.address,
                                            style: TextStyle(
                                                color:cGrey ,
                                                fontSize: 17,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ],
                                    ),

                                  ],
                                ),
                              ));
                        },
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
