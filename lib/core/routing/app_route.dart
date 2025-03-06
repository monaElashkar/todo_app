import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/cubit/main_cubit.dart';
import 'package:todo_app/core/data/user_data.dart';
import 'package:todo_app/core/routing/route_name.dart';
import 'package:todo_app/feature/home/presentation/screens/home_screen.dart';

import '../../feature/auth/presentation/screens/login_veiw/login_screen.dart';
import '../../feature/auth/presentation/screens/register_veiw/register_screen.dart';
import '../../feature/home/presentation/screens/add_task_screen.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.initializeApp:
       if(UserData.authStateChanges()){
        return MaterialPageRoute(builder: (context)=>LoginScreen());
       }else{
        return MaterialPageRoute(builder: (context)=>HomeScreen());
       }
      case RouteName.login:
       return MaterialPageRoute(builder: (context)=>LoginScreen());
      case RouteName.home:
       return MaterialPageRoute(builder: (context)=>HomeScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (context)=>RegisterScreen());
      case RouteName.add:
        return MaterialPageRoute(builder: (context)=>AddTaskScreen());
      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}