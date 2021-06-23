import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


InputDecoration customInputDecoration = InputDecoration(
    hintStyle: TextStyle(color: Colors.white),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.5)
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.5)
    )
);



Widget getCustomElevatedButton({@required onPressed , String buttonText}){
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white))),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 30,vertical: 20)),
            backgroundColor:
            MaterialStateProperty.all(Colors.transparent)),
        onPressed: onPressed,
        child: Text(buttonText,style: TextStyle(fontSize: 15),));
}



class LoadingScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Center(
                child: SpinKitFadingCircle(
                    color: Colors.indigo,
                    size: 50,
                ),

            ),
        );
    }
}
