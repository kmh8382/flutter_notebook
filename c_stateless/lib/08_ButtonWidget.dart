import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  const ButtonWidget({super.key});

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    /*
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () { showSnackBar(context, "TextButton"); },
          child: const Text("TextButton"),
        ),
        ElevatedButton(
          onPressed: () { showSnackBar(context, "ElevatedButton"); },
          child: const Text("ElevatedBtn"),
        ),
        IconButton(
          onPressed: () { showSnackBar(context, "IconButton"); },
          icon: Icon(Icons.add_box_outlined),
        ),
      ],
    );
    */

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  showSnackBar(context, "FloatingActionButton");  },
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

  }

}