import 'dart:collection';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'modelclass.dart';

class providerclass extends ChangeNotifier{
  TextEditingController textcontroller=TextEditingController();
        List<todo> tododata=[];

 final FirebaseFirestore db = FirebaseFirestore.instance;



 void adddata(String from,String oldid,){
         String id = DateTime.now().millisecondsSinceEpoch.toString();
         HashMap<String, Object> map = HashMap();
         map["id"]=id;
         map["text"]= textcontroller.text;
         if(from=="edit"){
           db.collection("details").doc(oldid).update(map);
         }else{

         db.collection("details").doc(id).set(map);
         }
         notifyListeners();
 }
 void getdata(){
         db.collection("details").get().then((value) {
           tododata.clear();

           if(value.docs.isNotEmpty){
            for( var elements in value.docs) {
              Map<dynamic ,dynamic>detailsmap = elements.data();
              tododata.add(todo(detailsmap["id"].toString(),
                  detailsmap["text"].toString()));
            }
            notifyListeners();
            };
           }
         );
         print(tododata);
 }
   void deletedata(String id){

   db.collection("details").doc(id).delete();

   notifyListeners();
   }

   void ediitdata(String id){
   db.collection("details").doc(id).get().then((value){
     if(value .exists){
       Map<dynamic,dynamic>map=value.data() as Map;
       textcontroller.text=map["text"].toString();
     }
     notifyListeners();
   });
   notifyListeners();
   }


}