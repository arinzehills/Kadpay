import 'package:flutter/material.dart';

import '../../components/my_text_field.dart';
import '../../components/myoval_gradient_button.dart';
import '../../components/mypop_widget.dart';
import '../../constants/constant.dart';
import '../login.dart';
import 'name_page.dart';

class PinPage extends StatefulWidget {
    final controller;

  const PinPage({ Key? key,
          required this.controller, }) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyFormWidget(name: 'Register', image: 'smart_commando.png'),
        Padding(
          padding: const EdgeInsets.only(left:28.0),
          child: Text('Enter the 4 digits action pin that you will use anytime'
                +'you want to trigger a security action ',
                style: TextStyle(color: myBlue),),
        ),
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 10,right: 20),
                  child: MyTextField(
                  validator: (val)=> val!.isEmpty ? 'Please Enter an address' : null,
                  hintText: 'Enter address',
                  keyboardType:TextInputType.name,
                  autovalidate: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:8.0,top: 10),
                  child: MyOvalGradientButton(
                    width: MediaQuery.of(context).size.width* 0.9,
                    height: 60,
                    firstcolor: myBlueGradient[1],
                    secondcolor: myBlueGradient[0],
                    pressed: (){
                        if(_formKey.currentState!.validate()){
                           myPopUp(context, 'Completed', popComplete());
                    
                            }
                    } ,
                      placeHolder: 'Complete',
                  )
                ),
              ],
            ),
          ),
      ],
    );
  }
  Widget popComplete()=>Column(
    children: [
         Container(
                    padding: EdgeInsets.all(0.0),
                    height: 150,
                     child:
                      Image.asset('assets/smart_commando.png' )
                ),
              MyOvalGradientButton(placeHolder: 'Login', 
              pressed: (){
                  // MyNavigate.navigatejustpush(Login(), context);
              }, 
              firstcolor: Colors.red, 
              secondcolor: myBlue)
    ],
  );
}