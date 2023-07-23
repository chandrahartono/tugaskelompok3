import 'dart:math';

import 'package:flutter/material.dart';

    void main(){
    runApp(Calculator());
    }

    class Calculator extends StatelessWidget {
      const Calculator({super.key});
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
          title: "Calculator",
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SimpleCalculator(),
        );
      }
    }
    class SimpleCalculator extends StatefulWidget {
      const SimpleCalculator({super.key});
    
      @override
      State<SimpleCalculator> createState() => _SimpleCalculatorState();
    }
class LaporanScreen extends StatefulWidget {
  final List<String> savedStrings;

  LaporanScreen({required this.savedStrings});

  @override
  _LaporanScreenState createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Laporan")),
      body: ListView.builder(
        itemCount: widget.savedStrings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.savedStrings[index]),
          );
        },
      ),
    );
  }
}


class _SimpleCalculatorState extends State<SimpleCalculator> {
      String expression ="";
      List<String> savedStrings = [];
      void buttonPressed(String buttonText) {
        setState(() {
          if (buttonText == "Simpan") {
            savedStrings.add(expression);
            expression = "";
          } else if (buttonText == "laporan") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LaporanScreen(savedStrings: savedStrings),
              ),
            );
          }
          else if (buttonText == "Home"){
            savedStrings.clear();
            expression = "";
          }
            else {
            expression = expression + buttonText;
          }
        });
      }


      Widget buildButton(String buttonText, double buttonHeight, Color colorButton){
      return Container(
        height: MediaQuery.of(context).size.height*0.1 * buttonHeight,
        color: colorButton,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid
            )
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text("Tugas Ketiga")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end, // Align the content at the bottom
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(expression,style: TextStyle(fontSize: 40)),
              ),
              Align(
                alignment: Alignment.bottomLeft, // Align the Row at the bottom-left
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Table(
                        children: [
                          TableRow(children: [
                            buildButton("7", 1, Colors.black12),
                            buildButton("8", 1, Colors.black12),
                            buildButton("9", 1, Colors.black12),
                          ]),
                          TableRow(children: [
                            buildButton("4", 1, Colors.white),
                            buildButton("5", 1, Colors.white),
                            buildButton("6", 1, Colors.white),
                          ]),
                          TableRow(children: [
                            buildButton("1", 1, Colors.white),
                            buildButton("2", 1, Colors.white),
                            buildButton("3", 1, Colors.white),
                          ]),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      child: Table(
                        children: [
                          TableRow(children: [
                            buildButton("0", 1, Colors.white),
                          ]),
                          TableRow(children: [
                            buildButton("Simpan", 2, Colors.pink),
                          ])
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*1,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              buildButton("Home", 1, Colors.redAccent),
                              buildButton("laporan", 1, Colors.green)
                            ]
                          )
                        ],
                      ),
                      
                    )
                  ],
                ),
              )
              // Add more children to the Column if needed
            ],
          ),
        );
      }
    }
    