import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


InputDecoration customInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.5)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.5)
    )
);



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
