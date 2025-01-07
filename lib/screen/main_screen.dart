import 'package:flutter/material.dart';
import 'package:fluttery/model/dummy_data.dart';
import 'package:fluttery/screen/about_screen.dart';

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
        body: SingleChildScrollView(child: FlutterFactsGrid()));
  }
}

class FlutterFactsGrid extends StatelessWidget {
  const FlutterFactsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: factsList.map((facts) {
          return Card(
            elevation: 0,
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(facts.bannerUrl),
                  Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert)),
                          Text(facts.title)
                        ],
                      ))
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
