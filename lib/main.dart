// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

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
  int ohscore = 0;
  int exxscore = 0;
  int filledboxes=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(children: <Widget>[
          Expanded(
              child: Container(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Player x",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(exxscore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Player o",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(ohscore.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30)),
                    ]),
              )
            ],
          ))),
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
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
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
      if (onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
         filledboxes==1;
      } else if (!onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
         filledboxes==1;
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
    else if(filledboxes==9){
      _showDrawDialog();
    }
  }
 void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearcode();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Play again",
                  ))
            ],
          );
        });
  }

  void _showinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER Is: ' + winner),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearcode();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Play again",
                  ))
            ],
          );
        });
    if (winner == 'o') {
      ohscore += 1;
    } else if (winner == 'x') {
      exxscore += 1;
    }
  }

  void _clearcode() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
  }

}

