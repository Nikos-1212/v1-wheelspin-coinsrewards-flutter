class GameOrchestrationModel {
  GameOrchestrationResponse? gameOrchestrationResponse;

  GameOrchestrationModel({this.gameOrchestrationResponse});

  GameOrchestrationModel.fromJson(Map<String, dynamic> json) {
    gameOrchestrationResponse = json['gameOrchestrationResponse'] != null
        ? new GameOrchestrationResponse.fromJson(
            json['gameOrchestrationResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gameOrchestrationResponse != null) {
      data['gameOrchestrationResponse'] =
          this.gameOrchestrationResponse!.toJson();
    }
    return data;
  }
}

class GameOrchestrationResponse {
  List<Games>? games;
  bool? refreshStatus;

  GameOrchestrationResponse({this.games, this.refreshStatus});

  GameOrchestrationResponse.fromJson(Map<String, dynamic> json) {
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
    refreshStatus = json['refreshStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    data['refreshStatus'] = this.refreshStatus;
    return data;
  }
}

class Games {
  int? gameId;
  String? game;
  int? level;
  int? winningItem;
  GameDisplayCriteria? gameDisplayCriteria;
  String? updatedOn;
  int? ownerId;
  String? createdOn;
  String? effectiveTo;
  int? stage;
  String? completedOn;
  List<GameItems>? gameItems;
  int? gameKey;
  int? playerRole;
  String? effectiveFrom;
  String? status;

  Games(
      {this.gameId,
      this.game,
      this.level,
      this.winningItem,
      this.gameDisplayCriteria,
      this.updatedOn,
      this.ownerId,
      this.createdOn,
      this.effectiveTo,
      this.stage,
      this.completedOn,
      this.gameItems,
      this.gameKey,
      this.playerRole,
      this.effectiveFrom,
      this.status});

  Games.fromJson(Map<String, dynamic> json) {
    gameId = json['gameId'];
    game = json['game'];
    level = json['level'];
    winningItem = json['winningItem'];
    gameDisplayCriteria = json['gameDisplayCriteria'] != null
        ? new GameDisplayCriteria.fromJson(json['gameDisplayCriteria'])
        : null;
    updatedOn = json['updatedOn'];
    ownerId = json['ownerId'];
    createdOn = json['createdOn'];
    effectiveTo = json['effectiveTo'];
    stage = json['stage'];
    completedOn = json['completedOn'];
    if (json['gameItems'] != null) {
      gameItems = <GameItems>[];
      json['gameItems'].forEach((v) {
        gameItems!.add(new GameItems.fromJson(v));
      });
    }
    gameKey = json['gameKey'];
    playerRole = json['playerRole'];
    effectiveFrom = json['effectiveFrom'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gameId'] = this.gameId;
    data['game'] = this.game;
    data['level'] = this.level;
    data['winningItem'] = this.winningItem;
    if (this.gameDisplayCriteria != null) {
      data['gameDisplayCriteria'] = this.gameDisplayCriteria!.toJson();
    }
    data['updatedOn'] = this.updatedOn;
    data['ownerId'] = this.ownerId;
    data['createdOn'] = this.createdOn;
    data['effectiveTo'] = this.effectiveTo;
    data['stage'] = this.stage;
    data['completedOn'] = this.completedOn;
    if (this.gameItems != null) {
      data['gameItems'] = this.gameItems!.map((v) => v.toJson()).toList();
    }
    data['gameKey'] = this.gameKey;
    data['playerRole'] = this.playerRole;
    data['effectiveFrom'] = this.effectiveFrom;
    data['status'] = this.status;
    return data;
  }
}

class GameDisplayCriteria {
  int? itemCount;

  GameDisplayCriteria({this.itemCount});

  GameDisplayCriteria.fromJson(Map<String, dynamic> json) {
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemCount'] = this.itemCount;
    return data;
  }
}

class GameItems {
  int? itemId;
  String? outcomeName;
  int? sortIndex;
  bool? startItem;
  GameItemDisplayCriteria? gameItemDisplayCriteria;
  String? outcomeValue;
  int? outcome;
  int? outcomeValueId;

  GameItems(
      {this.itemId,
      this.outcomeName,
      this.sortIndex,
      this.startItem,
      this.gameItemDisplayCriteria,
      this.outcomeValue,
      this.outcome,
      this.outcomeValueId});

  GameItems.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    outcomeName = json['outcomeName'];
    sortIndex = json['sortIndex'];
    startItem = json['startItem'];
    gameItemDisplayCriteria = json['gameItemDisplayCriteria'] != null
        ? new GameItemDisplayCriteria.fromJson(json['gameItemDisplayCriteria'])
        : null;
    outcomeValue = json['outcomeValue'];
    outcome = json['outcome'];
    outcomeValueId = json['outcomeValueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['outcomeName'] = this.outcomeName;
    data['sortIndex'] = this.sortIndex;
    data['startItem'] = this.startItem;
    if (this.gameItemDisplayCriteria != null) {
      data['gameItemDisplayCriteria'] = this.gameItemDisplayCriteria!.toJson();
    }
    data['outcomeValue'] = this.outcomeValue;
    data['outcome'] = this.outcome;
    data['outcomeValueId'] = this.outcomeValueId;
    return data;
  }
}

class GameItemDisplayCriteria {
  String? weightingType;
  String? weighting;

  GameItemDisplayCriteria({this.weightingType, this.weighting});

  GameItemDisplayCriteria.fromJson(Map<String, dynamic> json) {
    weightingType = json['weightingType'];
    weighting = json['weighting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weightingType'] = this.weightingType;
    data['weighting'] = this.weighting;
    return data;
  }
}
