// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location_app/app_router.dart';

import 'core/constant/mu_strigs.dart';


late String initalRoute;








void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

FirebaseAuth.instance.authStateChanges().listen((user){
if(user==null){
  initalRoute = loginScreen;
}
else{
  initalRoute = mapScreen;
}
});



  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
  MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initalRoute,
    );
  }
}
