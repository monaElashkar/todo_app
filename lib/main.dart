import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cubit/main_cubit.dart';
import 'core/routing/app_route.dart';
import 'core/routing/route_name.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(create: (context) => MainCubit(),
            child: MaterialApp(
              title: 'TODO APP',
              debugShowCheckedModeBanner: false,
              initialRoute: RouteName.initializeApp,
              onGenerateRoute: AppRoute.generateRoute,
              //home: HomeScreen(),
            ),
          );
        });
  }
}
