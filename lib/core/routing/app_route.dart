import 'package:flutter/material.dart';
import 'package:todo_app/core/routing/route_name.dart';
import 'package:todo_app/feature/home/presentation/screens/home_screen.dart';

import '../../feature/auth/presentation/screens/login_veiw/login_screen.dart';
import '../../feature/auth/presentation/screens/register_veiw/register_screen.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.initializeApp:
       if(true){
        return MaterialPageRoute(builder: (context)=>LoginScreen());
       }else{
        return MaterialPageRoute(builder: (context)=>HomeScreen());
       }
      case RouteName.login:
       return MaterialPageRoute(builder: (context)=>LoginScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (context)=>RegisterScreen());
      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}