import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_crud_operations/controller/posts_controller.dart';

import 'package:rest_api_crud_operations/view/posts_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => PostsController(),
    child: MaterialApp(home:PostsManager(),debugShowCheckedModeBanner: false,),
    );
  }
}
