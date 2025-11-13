import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Start a tet?'),
            ElevatedButton(
              onPressed: () {}, 
              child: Text('')
            )
          ],
        ),
      ),
    );
  }
}
