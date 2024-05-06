import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget text(String name, FontWeight weight, Color mycolor, double size) {
  return Text(
    name,
    style: TextStyle(
        fontWeight: weight,
        color: mycolor,
        fontSize: size,
        fontFamily: "dmsans"),
  );
}

Widget textfieldphn(TextEditingController controller,
    TextInputType keyboardtype, String validationtext, String labeltxt) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      textAlign: TextAlign.center,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      controller: controller,
      keyboardType: keyboardtype,
      maxLength: 10,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        helperText: "",
        labelText: labeltxt,
        labelStyle: TextStyle(fontSize: 12),

        hintStyle: TextStyle(color: Colors.grey[400]),
        // prefixIcon:const Icon(Icons.person,color: Colors.green,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return validationtext;
        } else {
          return null;
        }
      },
    ),
  );
}

Widget textfieldage(TextEditingController controller,
    TextInputType keyboardtype, String validationtext, String labeltxt) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      textAlign: TextAlign.center,
      inputFormatters: [LengthLimitingTextInputFormatter(3)],
      controller: controller,
      keyboardType: keyboardtype,
      maxLength: 3,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        helperText: "",
        labelText: labeltxt,
        labelStyle: TextStyle(fontSize: 12),

        hintStyle: TextStyle(color: Colors.grey[400]),
        // prefixIcon:const Icon(Icons.person,color: Colors.green,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return validationtext;
        } else {
          return null;
        }
      },
    ),
  );
}

Widget textfield(TextEditingController controller, TextInputType keyboardtype,
    String validationtext, String labeltxt) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        helperText: "",
        labelText: labeltxt,
        labelStyle: TextStyle(fontSize: 12),

        hintStyle: TextStyle(color: Colors.grey[400]),
        // prefixIcon:const Icon(Icons.person,color: Colors.green,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return validationtext;
        } else {
          return null;
        }
      },
    ),
  );
}
