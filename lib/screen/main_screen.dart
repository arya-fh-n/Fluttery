import 'package:flutter/material.dart';
import 'package:fluttery/model/dummy_data.dart';
import 'package:fluttery/model/flutter_facts.dart';
import 'package:fluttery/screen/about_screen.dart';
import 'package:fluttery/screen/detail_screen.dart';
import 'package:fluttery/styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cool Flutter Fact's"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutScreen();
                  }));
                },
                icon: Icon(Icons.info_outline_rounded))
          ],
        ),
        body: FlutterFactsList());
  }
}

class FlutterFactsList extends StatelessWidget {
  const FlutterFactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ListView.builder(
          itemBuilder: (context, index) {
            final FlutterFacts facts = factsList[index];
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(facts: facts);
                  }));
                },
                child: Card(
                  elevation: 5.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Hero(
                              tag: facts.id,
                              child: Image.asset(facts.bannerUrl,
                                  fit: BoxFit.fitHeight))),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  facts.title,
                                  style: titleStyleMainPage,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(facts.subtitle, style: subtitleStyle)
                              ],
                            ),
                          ))
                    ],
                  ),
                ));
          },
          itemCount: factsList.length),
    );
  }
}
