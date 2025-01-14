import 'package:flutter/material.dart';
import 'package:fluttery/model/flutter_facts.dart';

import '../styles.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.facts});

  final FlutterFacts facts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
              SafeArea(
                  child: Hero(
                      tag: facts.id,
                      child: Image.asset(facts.bannerUrl))),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(facts.title,
                    textAlign: TextAlign.center, style: titleStyle),
                SizedBox(height: 30),
                Text(facts.subtitle,
                    textAlign: TextAlign.center, style: contentStyle)
              ],
            ),
          ),
          DetailContent(facts: facts)
        ],
      ),
    ));
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({super.key, required this.facts});

  final FlutterFacts facts;

  @override
  Widget build(BuildContext context) {
    var titleStyleSmaller = TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Oxygen');

    var contentStyle = TextStyle(fontSize: 16.0, fontFamily: 'Oxygen');

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Text("Pros", style: titleStyleSmaller),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: facts.pros.map((pro) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(pro, style: contentStyle),
                  );
                }).toList(),
              )
            ],
          ),
          Column(children: [
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                Text("Cons", style: titleStyleSmaller),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: facts.cons.map((con) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(con, style: contentStyle),
                );
              }).toList(),
            )
          ])
        ],
      ),
    );
  }
}
