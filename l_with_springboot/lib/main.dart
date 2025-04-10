import 'package:flutter/material.dart';
import 'package:l_with_springboot/view/ProductListPage.dart';
import 'package:l_with_springboot/view/ProductModifyPage.dart';
import 'package:l_with_springboot/view/ProductRegistPage.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

// View - Provider(ViewModel) - Service - Model

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ProductListPage(),
      initialRoute: "/",
      routes: {
        // "/": (context) => ProductListPage(),
        "/regist": (context) => ProductRegistPage(), // "/regist" 요청이 오면 ProductListPage 위젯을 엽니다.
        "/list": (context) => ProductListPage(),
        "/modify": (context) => ProductModifyPage(),
      },

    );
  }
}
