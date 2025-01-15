import 'package:fluttery/model/flutter_facts.dart';

var factsList = [
  FlutterFacts(
      id: "fact1",
      bannerUrl: "images/flutter-banner-1.jpg",
      title: "Single Codebase",
      subtitle:
          " Flutter allows developers to write one codebase that can run on iOS, Android, web, desktop, and more.",
      pros: [
        "Saves development time and effort.",
        "Reduces maintenance costs by managing a single codebase.",
        "Provides a consistent UI/UX across platforms."
      ],
      cons: [
        "Platform-specific functionality may still require additional native code.",
        "Large apps might have a larger binary size compared to native apps."
      ]),
  FlutterFacts(
      id: "fact2",
      bannerUrl: "images/flutter-banner-2.jpg",
      title: "Uses Dart",
      subtitle:
          "Flutter apps are written in Dart, a language created by Google.",
      pros: [
        "Easy to learn, especially those familiar with JavaScript/Java.",
        "Native-like performance due to Ahead-of-Time (AOT) compilation.",
        "Offers features like null safety to prevent runtime errors."
      ],
      cons: [
        "Limited resources and community support"
      ]),
  FlutterFacts(
      id: "fact3",
      bannerUrl: "images/flutter-banner-3.jpg",
      title: "Hot Reload",
      subtitle:
          "Hot reload allows developers to see UI changes instantly without restarting the app.",
      pros: [
        "Significantly speeds up the development process.",
        "Encourages experimentation and rapid prototyping.",
        "Simplifies debugging by allowing real-time fixes."
      ],
      cons: [
        "Some changes, like state changes or dependency updates, require a full restart.",
        "Might not always work smoothly with complex apps."
      ]),
  FlutterFacts(
      id: "fact4",
      bannerUrl: "images/flutter-banner-4.jpg",
      title: "Open Source",
      subtitle:
          "Flutter is free to use and has a growing open-source community.",
      pros: [
        "Accessible to all developers",
        "Open-source community contributes to its constant improvement and library ecosystem."
      ],
      cons: [
        "Updates and fixes might take longer.",
      ])
];
