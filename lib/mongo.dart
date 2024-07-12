import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:trotters/constant.dart';

List live_match = [];
List scorePoolA = [];

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var collection = db.collection(COLLECTION_NAME);
    var poolacollection = db.collection(poolaCollection);
    var liveMatche = await collection.find().toList();
    var poolateams = await poolacollection.find().toList();
    live_match.addAll(liveMatche);
    scorePoolA.addAll(poolateams);
  }
}
