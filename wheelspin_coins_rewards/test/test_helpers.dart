import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wheelspin_coins_rewards/wheelspin_coins_rewards_widget.dart';

Future pumpFortuneWidget(WidgetTester tester, FortuneWidget widget) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    ),
  );
}

const List<FortuneItem> testItems = <FortuneItem>[
  // FortuneItem(child: Text('1'), sliceItemData: {}),
  // FortuneItem(child: Text('2'), sliceItemData: {}),
];
