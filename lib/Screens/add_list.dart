import 'package:crud_operation/constants/callFunctions.dart';
import 'package:crud_operation/provider/mainprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/myWidget.dart';
import '../constants/mycolors.dart';

class AddList extends StatelessWidget {
  String from;
  String oldid;
  AddList({super.key,required this.from,required this.oldid});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: tViloet,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              back(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: cWhite,
              size: 24,
            ),
          ),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Consumer<MainProvider>(builder: (context, value, child) {
                    return textfield(value.namecontoller, TextInputType.name,
                        "enter your name", "Name");
                  }),
                  Consumer<MainProvider>(builder: (context, value, child) {
                    return textfieldphn(
                        value.phonenumbercontroller,
                        TextInputType.phone,
                        "enter your Number",
                        "Phone Number");
                  }),
                  Consumer<MainProvider>(builder: (context, value, child) {
                    return textfieldage(value.agecontroller, TextInputType.phone,
                        "enter your Age", "Age");
                  }),
                  Consumer<MainProvider>(builder: (context, value, child) {
                    return textfield(value.addresscontroller,
                        TextInputType.text, "enter your address", "Address");
                  }),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: SizedBox(
          height: 49,
          width: width / 1.1,
          child: Consumer<MainProvider>(builder: (context, value, child) {
            return   value.loader?CircularProgressIndicator(color: tViloet,):FloatingActionButton(
              onPressed: () {
                final FormState? form = _formKey.currentState;
                if (form!.validate()) {

                  if(from=="NEW"){
                    value.addDetails(from,"");

                    value.getdetails();
                    back(context);
                  }else{
                    value.addDetails(from,oldid);

                    value.getdetails();
                    back(context);
                  }

                }
              },
              elevation: 0,
              backgroundColor: tViloet,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(42),
              ),
              child: text(
                "Add Details",
                FontWeight.w700,
                cWhite,
                18,
              ),
            );
          }),
        ));
  }
}
