import 'package:brew_crew_new/model/user.dart';
import 'package:brew_crew_new/screens/authenticate/authenticate.dart';
import 'package:brew_crew_new/screens/authenticate/sign_in.dart';
import 'package:brew_crew_new/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final userStream = Provider.of<UserDetail>(context);
    print(userStream);
    if(userStream == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
