import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants/constant.dart';
import 'gradient_text.dart';

class MyDrawer extends StatefulWidget {
  final int? userid;
  final String? username;
  // final String email;
  // final String phone;

  MyDrawer({Key? key, this.username, this.userid}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var userData;
  int _selectedIndex = 0;
  List<Color> selectedColors = myOrangeGradient;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
    selectedColors = myBlueGradient;
  }

  @override
  void initState() {
    super.initState();
    // var index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    // final user= Provider.of<Users>(context);
    //  var myred=Color(MyApp().myred);
    List label = ['dashboard', 'Buyn'];

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 190,
                      child: Wrap(
                        children: [
                          Text(
                            'dskda',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: Wrap(
                      children: [
                        SizedBox(
                          width: 190,
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [myLightOrange, myOrange]),
          ),
        ),
        ListTile(
          // leading: Icon(Icons.input,color:Colors.red,),
          title: Center(
            child: GradientText(
              'Dashboard ',
              style: const TextStyle(fontSize: 30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: selectedColors,
              ),
            ),
          ),
          onTap: () => {
            setState(() {
              _selectedIndex = 0;
            }),

            // MyNavigate.navigatejustpush(HomePageNavagation(), context)
          },
          selected: _selectedIndex == 1,
        ),
        ListTile(
          // leading: Icon(Icons.input,color:Colors.red,),
          title: Center(
            child: GradientText(
              'Transactions',
              style: const TextStyle(fontSize: 30),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: selectedColors),
            ),
          ),
          selected: _selectedIndex == 2,
          onTap: () => {
            //  MyNavigate.navigatepushuntil(HomePageNavagation(index: 1,), context),
            setState(() {
              _selectedIndex = 2;
            }),
          },
        ),
        ListTile(
          // leading: Icon(Icons.input,color:Colors.red,),

          title: Center(
            child: GradientText(
              'Buy units ',
              style: const TextStyle(fontSize: 30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: selectedColors,
              ),
            ),
          ),
          onTap: () => {
            _onSelected(3),
            print(_selectedIndex),
            Navigator.pop(context),
            //  popUp(context,widget.userid)
          },
          selected: _selectedIndex == 3,
        ),
        ListTile(
          // leading: Icon(Icons.input,color:Colors.red,),
          title: Center(
            child: GradientText(
              'Contact us ',
              style: const TextStyle(fontSize: 30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: selectedColors,
              ),
            ),
          ),
          onTap: () => {
            setState(() {
              _selectedIndex = 4;
            }),
          },
          selected: _selectedIndex == 4,
        ),
        ListTile(
          // leading: Icon(Icons.input,color:Colors.red,),
          title: Center(
            child: GradientText(
              'Profile',
              style: const TextStyle(fontSize: 30),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: selectedColors),
            ),
          ),
          onTap: () => {
            setState(() {
              _selectedIndex = 5;
            }),
            //  MyNavigate.navigatejustpush(Profile(), context)
          },
          selected: _selectedIndex == 5,
        ),
      ]),
    );
  }

  Widget itemsList(labels) => ListView.builder(
      itemCount: labels.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index ' + labels.index),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      });
}
