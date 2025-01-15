import 'package:flutter/material.dart';
import 'package:fluttery/model/flutter_facts.dart';

import '../styles.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.facts});

  final FlutterFacts facts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: const BookmarkButton(),
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
                  SafeArea(
                      child: Hero(
                          tag: facts.id, child: Image.asset(facts.bannerUrl))),
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
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: facts.pros.map((pro) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.numbers_rounded, color: Colors.cyan),
                          SizedBox(width: 5),
                          Flexible(child: Text(pro, style: contentStyle)),
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Flexible(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.numbers_rounded, color: Colors.red),
                        SizedBox(width: 5),
                        Flexible(child: Text(con, style: contentStyle)),
                      ],
                    ),
                  );
                }).toList(),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text(isBookmark ? 'Un-bookmarked' : 'Bookmarked!'));

    return FloatingActionButton(
      tooltip: "Save",
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
      backgroundColor: Colors.white,
      child: Icon(
          isBookmark ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.cyan
      ),
    );
  }
}
