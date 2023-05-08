import 'package:expense_api/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Flutter",style: TextStyle(color:Colors.blue),),
            Text("News",style: TextStyle(color: Colors.red),)
          ],
        ),
        elevation: 10,
      ),
      body:home(),
    );
  }
}