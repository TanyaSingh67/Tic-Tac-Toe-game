import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool onTurn = true;
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children:<Widget> [
            Expanded(child: Container(
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Player x",style: TextStyle(color: Colors.white,fontSize: 30),),
                  Text("Player o", style: TextStyle(color: Colors.white,fontSize: 30)),
                  
                ],
              )
            
            )),
            
           Expanded(
            flex: 3,
             child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700)),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
              
                  ),
                );
              },
                       ),
           ),

             Expanded(child: Container()),
        ]));
  }

  void _tapped(int index) {
    setState(() {
      if (onTurn && displayExOh[index]=='') {
        displayExOh[index] = 'o';
      } else if(!onTurn && displayExOh[index]=='') {
        displayExOh[index] = 'x';
      }

      onTurn = !onTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showinDialog(displayExOh[0]);
    }

    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showinDialog(displayExOh[3]);
    }

    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showinDialog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showinDialog(displayExOh[0]);
    }

    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showinDialog(displayExOh[1]);
    }

    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showinDialog(displayExOh[2]);
    }

    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showinDialog(displayExOh[0]);
    }

    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showinDialog(displayExOh[2]);
    }
  }

  void _showinDialog(String winne) {
    showDialog(context: context, builder: (BuildContext context) {
      return const AlertDialog(
title: Text('WINNER!'),
      );
    });
  }
}
