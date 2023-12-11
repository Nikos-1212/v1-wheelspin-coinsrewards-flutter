import 'package:flutter/material.dart';

class AppConstants {
  static Color backgroundColor = const Color(0xffFFFFFF);
  static EdgeInsetsGeometry commonSidePadding =
      const EdgeInsets.only(left: 16, right: 16);
  static EdgeInsetsGeometry commonAllPadding16 = const EdgeInsets.all(16);
  static BorderRadius commonButtonRedius = BorderRadius.circular(20.0);
  static BorderRadius commonButtonRedius4 = BorderRadius.circular(4.0);
  static const String authIdToken = 'id_token';
  static const String partyId = 'partyId';
  static const String tenantId = 'tenantId';
  static const String email = 'email';
  static const String monetary = 'Monetary';
  static const String value = 'Value';
  static const String weighting3 = '3';
  static const String txtyoudiditnowspinit_001 = 'You did it! Now spin it.';//txtyoudiditnowspinit_001
  static const String txtswiptetospin_001 = 'Swipe to spin for your reward.';//txtswiptetospin_001
  static const String ctrl_txtwhatsonthewheel_001 = 'What’s on the wheel?';//ctrl_txtwhatsonthewheel_001

  static const String loginResponse = 'loginResponse';

  static Map<String, dynamic> gameOrchestrationResponse = {
    "gameOrchestrationResponse": {
      "games": [
        {
          "gameId": 682110,
          "game": "Vitality Wheel",
          "level": 1,
          "winningItem": 11,
          "gameDisplayCriteria": {"itemCount": 16},
          "updatedOn": "9999-12-31T00:00:00Z[UTC]",
          "ownerId": 23901544,
          "createdOn": "2023-09-04",
          "effectiveTo": "9999-12-31",
          "stage": 99980000001,
          "completedOn": "9999-12-31T00:00:00Z[UTC]",
          "gameItems": [
            {
              "itemId": 1,
              "outcomeName": "Coins",
              "sortIndex": 1,
              "startItem": true,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "1"
              },
              "outcomeValue": "30.0",
              "outcome": 60,
              "outcomeValueId": 99980000030
            },
            {
              "itemId": 2,
              "outcomeName": "Coins",
              "sortIndex": 2,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "2"
              },
              "outcomeValue": "50.0",
              "outcome": 60,
              "outcomeValueId": 99980000029
            },
            {
              "itemId": 3,
              "outcomeName": "Coins",
              "sortIndex": 3,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "3"
              },
              "outcomeValue": "100.0",
              "outcome": 60,
              "outcomeValueId": 99980000028
            },
            {
              "itemId": 4,
              "outcomeName": "Gift Card",
              "sortIndex": 4,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Monetary",
                "weighting": "4"
              },
              "outcomeValue": "USD 5",
              "outcome": 26,
              "outcomeValueId": 99980000027
            },
            {
              "itemId": 5,
              "outcomeName": "Coins",
              "sortIndex": 5,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "1"
              },
              "outcomeValue": "30.0",
              "outcome": 60,
              "outcomeValueId": 99980000030
            },
            {
              "itemId": 6,
              "outcomeName": "Coins",
              "sortIndex": 6,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "2"
              },
              "outcomeValue": "50.0",
              "outcome": 60,
              "outcomeValueId": 99980000029
            },
            {
              "itemId": 7,
              "outcomeName": "Coins",
              "sortIndex": 7,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "3"
              },
              "outcomeValue": "100.0",
              "outcome": 60,
              "outcomeValueId": 99980000028
            },
            {
              "itemId": 8,
              "outcomeName": "Gift Card",
              "sortIndex": 8,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Monetary",
                "weighting": "4"
              },
              "outcomeValue": "USD 5",
              "outcome": 26,
              "outcomeValueId": 99980000027
            },
            {
              "itemId": 9,
              "outcomeName": "Coins",
              "sortIndex": 9,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "1"
              },
              "outcomeValue": "30.0",
              "outcome": 60,
              "outcomeValueId": 99980000030
            },
            {
              "itemId": 10,
              "outcomeName": "Coins",
              "sortIndex": 10,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "2"
              },
              "outcomeValue": "50.0",
              "outcome": 60,
              "outcomeValueId": 99980000029
            },
            {
              "itemId": 11,
              "outcomeName": "Coins",
              "sortIndex": 11,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "3"
              },
              "outcomeValue": "100.0",
              "outcome": 60,
              "outcomeValueId": 99980000028
            },
            {
              "itemId": 12,
              "outcomeName": "Gift Card",
              "sortIndex": 12,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Monetary",
                "weighting": "4"
              },
              "outcomeValue": "USD 5",
              "outcome": 26,
              "outcomeValueId": 99980000027
            },
            {
              "itemId": 13,
              "outcomeName": "Coins",
              "sortIndex": 13,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "1"
              },
              "outcomeValue": "30.0",
              "outcome": 60,
              "outcomeValueId": 99980000030
            },
            {
              "itemId": 14,
              "outcomeName": "Coins",
              "sortIndex": 14,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "2"
              },
              "outcomeValue": "50.0",
              "outcome": 60,
              "outcomeValueId": 99980000029
            },
            {
              "itemId": 15,
              "outcomeName": "Coins",
              "sortIndex": 15,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Value",
                "weighting": "3"
              },
              "outcomeValue": "100.0",
              "outcome": 60,
              "outcomeValueId": 99980000028
            },
            {
              "itemId": 16,
              "outcomeName": "Gift Card",
              "sortIndex": 16,
              "startItem": false,
              "gameItemDisplayCriteria": {
                "weightingType": "Monetary",
                "weighting": "4"
              },
              "outcomeValue": "USD 5",
              "outcome": 26,
              "outcomeValueId": 99980000027
            }
          ],
          "gameKey": 1,
          "playerRole": 1,
          "effectiveFrom": "2017-01-01",
          "status": "Created"
        }
      ],
      "refreshStatus": true
    }
  };
}
