import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  String text;
  Function onbuttonclicked;

  ItemButton(this.text, this.onbuttonclicked);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ElevatedButton(
            onPressed: () {
              onbuttonclicked(text);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 25),
            )),
      ),
    );
  }
}
