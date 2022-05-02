import 'package:flutter/material.dart';

import '../constants/constant.dart';

class MyGradientTextField extends StatefulWidget {
  String hintText;
  String? value;
  bool? obscureText;
  bool? autovalidate;
  TextInputType? keyboardType;
  Function()? onTap;
  Function(String)? onChanged;
  // final VoidCallback pressed;
  IconButton? suffixIconButton;
  Icon? prefixIcon;
  String? Function(String?)? validator;

  // IconButton(
  //                                             icon: const Icon(Icons.visibility),
  //                                             color:iconsColor,
  //                                             onPressed: () {
  //                                              if(obscureText==true){
  //                                                 setState(() {
  //                                                   obscureText=false;
  //                                                 });
  //                                               }
  //                                               else{
  //                                                 setState(() {
  //                                             obscureText=true;
  //                                               });
  //                                               }
  //                                             },
  //                                         ),

  MyGradientTextField({
    required this.hintText,
    // required this.pressed,
    this.suffixIconButton,
    this.value,
    this.obscureText,
    this.validator,
    this.autovalidate,
    this.onTap,
    this.onChanged,
    this.keyboardType,
  });

  @override
  _MyGradientTextFieldState createState() => _MyGradientTextFieldState();
}

class _MyGradientTextFieldState extends State<MyGradientTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: myOrangeGradient)),
      child: TextFormField(
        validator: widget.validator,
        // maxLines: 2,
        // autovalidate: widget.autovalidate!,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap,
        obscureText: widget.obscureText ?? false,
        decoration: textFieldDecoration.copyWith(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIconButton,
            // fillColor: myBlue.withOpacity(0.5),
            // suffixIcon: ,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: myDarkBlue)),
        onChanged: widget.onChanged,
      ),
    );
  }
}
