import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var imageArray = ['dice1.jpg', 'dice2.jpg', 'dice3.jpg','dice4.jpg', 'dice5.jpg', 'dice6.jpg'];
  int randomIntForDice1 = Random().nextInt(6);
  int randomIntForDice2 = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text('The Total Count : ' + (randomIntForDice1 + randomIntForDice2 + 2).toString(), style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800, fontFamily: 'Nun',
                  ),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/'+ imageArray[randomIntForDice1], height: 150, width: 150,),
                  const SizedBox(width: 15,),
                  Image.asset('images/'+ imageArray[randomIntForDice2], height: 150, width: 150,),
                ],
              ),

              const SizedBox(height: 30,),

              InkWell(

                onTap: (){
                  changeImage();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height /13,
                  width: MediaQuery.of(context).size.width /2.5,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(120),
                      boxShadow: [
                        //bottom right shadow is darker shadow
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(5, 5),
                            blurRadius: 15,
                            spreadRadius: 1
                        ),

                        //top left shaow lighter
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]
                  ),
                  child: const Center(child: Text('Count', style: TextStyle(
                    fontFamily: 'Nun', fontWeight: FontWeight.w800, fontSize: 20
                  ),)),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
  void changeImage(){
    setState(() {
      randomIntForDice1 = Random().nextInt(6);
      randomIntForDice2 = Random().nextInt(6);
    });
  }
}

