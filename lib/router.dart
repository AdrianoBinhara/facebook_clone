import 'package:facebook_clone/main.dart';
import 'package:facebook_clone/routing_constants.dart';
import 'package:facebook_clone/undefined_view.dart';

import 'FeedPage.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRouter:
      return MaterialPageRoute(builder: (context) => MyApp());
    case FeedViewRouter:
      return MaterialPageRoute(builder: (context) => FeedPage());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefindedView(
                name: settings.name,
              ));
  }
}
