import 'package:flutter/material.dart';
import 'package:fluttery/model/profile.dart';
import 'package:fluttery/styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutContent(),
    );
  }

}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(24.0), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
            Image.asset(profilePicture),
            Text(profileName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontFamily: staatliches))
      ],
    ));
  }
}
