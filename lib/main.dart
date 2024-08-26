import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey[800],
        body: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: 9,
            itemBuilder:(BuildContext context, int index ){
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.grey.shade700)
                ),
                child: Center(
                  child: Text('',style: TextStyle(fontSize: 40, color: Colors.white),),
                ),
              );
            },
            ));
  }
}
