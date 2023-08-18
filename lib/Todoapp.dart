import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/providerclass.dart';

class TodoAPP extends StatelessWidget {
  const TodoAPP({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass todoprovider = Provider.of<providerclass>(context);
    todoprovider.getdata();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: Center(child: Text("TODO APP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
         color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: todoprovider.textcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'typing',
                        ),
                      ),
                      
                    ),
                 InkWell(
                   onTap: () {
                     todoprovider.adddata(todoprovider.tododata.toString(),
                         todoprovider.textcontroller.toString());
                   // todoprovider.adddata(

                   // todoprovider.tododata.id.,
                   //     todoprovider.tododata[index].text
                   // );
                   todoprovider.getdata();
                   },
                   child: Container(
                     margin: EdgeInsets.only(left: 10),
                     width:60,
                     height: 59,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),  color: Colors.blue,),
                     child: Center(child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),


                   ),
                 ),

                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Expanded(
                // height:400,
                // width: 400,
                child: ListView.builder(
                  itemCount: todoprovider.tododata.length,
                  itemBuilder: (context, index) {


                 return  InkWell(
                   onDoubleTap:() {
                     showDialog(
                       context: context,
                       builder: (ctx) => AlertDialog(
                         title: const Text("Alert Dialog Box"),
                         content: const Text("You have raised a Alert Dialog Box"),
                         actions: <Widget>[

                           TextButton(
                             onPressed: () {
                             todoprovider.ediitdata(todoprovider.tododata[index].id.toString());
                             Navigator.pop(context);

                             },
                             child: Container(
                               color: Colors.green,
                               padding: const EdgeInsets.all(14),
                               child: const Text("edit"),
                             ),
                           ),
                         ],

                       ),
                     );
                   },
                   child: Container(padding: EdgeInsets.symmetric(vertical: 5),
                     margin: EdgeInsets.symmetric(horizontal: 5,
                       vertical: 10

                     ),
                      // height: 60,
                      // width: 380,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),  color: Colors.indigo,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox ( width: 250,
                              child: Text(todoprovider.tododata[index].text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,))),
                          InkWell(
                            onTap: () {

                              todoprovider.deletedata(todoprovider.tododata[index].id.toString());
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left:250),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),  color: Colors.white),
                              child: Icon(Icons.delete),

                            ),
                          )

                        ],
                      ),

                    ),
                 );
                  },
                ),
              )

            ],

          ),
        ),
      ),

    );
  }
}
