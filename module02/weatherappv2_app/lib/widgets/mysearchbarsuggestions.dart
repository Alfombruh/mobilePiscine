import 'package:flutter/material.dart';

/*
stack overflow link reference
  https://stackoverflow.com/questions/50051126/flutter-search-bar-with-autocomplete
*/

// ignore: must_be_immutable
class MySearchBarSuggestions extends StatelessWidget {
  const MySearchBarSuggestions({super.key});

  // ignore: non_constant_identifier_names
  final bool _IsSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        /* appBar: buildBar(context),*/
        body: Stack(
          children: <Widget>[
            Container(
              height: 300.0,
              padding: const EdgeInsets.all(10.0),
              /*child: new DefaultTabController(length: 5, child: mainTabView),*/
            ),
            displaySearchResults(),
          ],
        ));
  }

  Widget displaySearchResults() {
    if (_IsSearching) {
      return const Align(
        alignment: Alignment.topCenter,
        //heightFactor: 0.0,
        /*child: searchList());*/
      );
    } else {
      return Align(alignment: Alignment.topCenter, child: Container());
    }
  }
}
