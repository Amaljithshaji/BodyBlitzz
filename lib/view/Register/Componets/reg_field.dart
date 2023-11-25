import 'package:flutter/material.dart';


class Reg_field extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;
  final  prefixIcon; 

  const Reg_field({
   super.key,
   required this.controller,
   required this.hintText,
   required this.obsecureText,
   required this.prefixIcon
});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (value) {
          
        },
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(color: Colors.black),
        
        
        decoration: InputDecoration(hintText: hintText,
        prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
