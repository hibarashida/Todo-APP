import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/mycolors.dart';
import '../modelclass/model.dart';

class MainProvider extends ChangeNotifier{
  final FirebaseFirestore db = FirebaseFirestore.instance;



  TextEditingController namecontoller=TextEditingController();
  TextEditingController phonenumbercontroller=TextEditingController();
  TextEditingController agecontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();

   bool loader=false;

  void addDetails(String from,String oldId){
    loader=true;
    notifyListeners();
    String id =DateTime.now().millisecondsSinceEpoch.toString();
    Map<String ,dynamic> map = HashMap();
    map["NAME"]=namecontoller.text;
    map["PHONE_NUMBER"]=phonenumbercontroller.text;
    map["AGE"]=agecontroller.text;
    map["ADDRESS"]=addresscontroller.text;

    if(from=="NEW"){
      map["DETAILS_ID"]=id;
    }

    if(from=="EDIT"){
      db.collection("DETAILS").doc(oldId).update(map);
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor :tViloet,
          textColor: cWhite,
          fontSize: 16.0,
          msg: 'Updated Successfully'
      );
    }else{
      db.collection("DETAILS").doc(id).set(map);
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor :tViloet,
          textColor: cWhite,
          fontSize: 16.0,
          msg: 'Added Successfully'
      );
    }
    loader=false;
    getdetails();
    notifyListeners();
  }

  void clear(){
    namecontoller.clear();
    phonenumbercontroller.clear();
    agecontroller.clear();
    addresscontroller.clear();
  }


  List<details> detailsList=[];
  bool getloader= false;


  void getdetails(){
    getloader=true;
    notifyListeners();
    db.collection("DETAILS").get().then((value) {
      if(value.docs.isNotEmpty){
        getloader=false;
        notifyListeners();
        detailsList.clear();
        for(var element in value.docs){
          Map<dynamic, dynamic> getmap = element.data();
          detailsList.add(details(
              getmap["NAME"].toString(),
              getmap["PHONE_NUMBER"].toString(),
              getmap["AGE"].toString(),
              getmap["ADDRESS"].toString(),
              getmap["DETAILS_ID"].toString(),
          ));
           notifyListeners();
        }
      }
    });
    notifyListeners();


  }

  void editdetails(String id) {
    db.collection('DETAILS').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMaps = value.data() as Map;
      if (value.exists) {
        namecontoller.text = dataMaps["NAME"].toString();
      phonenumbercontroller.text = dataMaps["PHONE_NUMBER"].toString();
        agecontroller.text = dataMaps["AGE"].toString();
        addresscontroller.text = dataMaps["ADDRESS"].toString();

      }
      notifyListeners();
    });
    notifyListeners();
  }
  void deletedetails(String id){
    db.collection("DETAILS").doc(id).delete();
    getdetails();
    notifyListeners();
  }
  






}
