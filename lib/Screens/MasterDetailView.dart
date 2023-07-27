import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CharacterDetailView.dart';
import 'CharacterListView.dart';

class MasterDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _TabletView();
          } else {
            return _MobileView();
          }
        },
      ),
    );
  }
}

class _TabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CharacterListView(),
        ),
        Expanded(
          flex: 2,
          child: CharacterDetailView(),
        ),
      ],
    );
  }
}

class _MobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CharacterListView();
  }
}
