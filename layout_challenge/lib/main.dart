import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/pudding.png'),
                radius: 100,
              ),

              // Image.asset('images/pudding.png'),
              Text(
                'Pudding',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Sans',
                    fontSize: 20,
                    letterSpacing: 5
                ),
              ),
              TextField(
                obscureText: true,
              ),
              TextField(
                obscureText: true,
              ),
              Icon(
                Icons.beach_access,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
