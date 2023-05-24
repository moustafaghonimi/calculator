import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_botton.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resultText = '';
  String finalResult = '0.0';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: CupertinoColors.secondarySystemFill,
        centerTitle: true,
        title: Text('Calculator',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        actions: [
          Text('By: M,ghonimi',style: TextStyle(fontSize: 8,color: Colors.white70),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      resultText,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    finalResult,
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemButton('7', onButtonCliced),
                  ItemButton('8', onButtonCliced),
                  ItemButton('9', onButtonCliced),
                  ItemButton('/', onOperatorCliced),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemButton('4', onButtonCliced),
                  ItemButton('5', onButtonCliced),
                  ItemButton('6', onButtonCliced),
                  ItemButton('*', onOperatorCliced),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemButton('1', onButtonCliced),
                  ItemButton('2', onButtonCliced),
                  ItemButton('3', onButtonCliced),
                  ItemButton('+', onOperatorCliced),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemButton('.', onButtonCliced),
                  ItemButton('0', onButtonCliced),
                  ItemButton('=', onEqual),
                  ItemButton('-', onOperatorCliced),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String calculate(String RHS,String op, String LHS){
    double res=0;
    double rhs=double.parse(RHS);
    double lhs=double.parse(LHS);
    if(op=='+'){
      res=rhs+lhs;
    }
   else if(op=='-'){
      res=rhs-lhs;
    }
    else if(op=='*'){
      res=rhs*lhs;
    }
    else if(op=='/'){
      res=rhs/lhs;
    }
    return res.toString();

  }

  String res='';
  String operator='';

  void onEqual(value){
    String LHS=resultText;
    res= calculate(res,operator,LHS);
    resultText=res;
    operator=value;
    finalResult=res;

    setState(() {

    });
  }

  void onOperatorCliced(op){
    if(operator.isEmpty){
      res=resultText;

    }
    else{
      String LHS=resultText;
     res= calculate(res,operator,LHS);
    }
    operator=op;
    resultText='';
    finalResult=res;

    setState(() {

    });

  }

  void onButtonCliced(text) {
    if(operator=='='){
      resultText='';
      resultText=text;

      operator='';
    }
    else{
      resultText += text;
    }
    finalResult=res;

    print(resultText);
    setState(() {});
  }
}
