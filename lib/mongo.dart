import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:trotters/constant.dart';

List live_match = [];
List scorePoolA = [];

class MongoDatabase {
  static Db? db;
  static DbCollection? match;
  static DbCollection? poola;

  static Future<void> connect() async {
    db = await Db.create(MONGO_URL);
    await db!.open();
    inspect(db);
    match = db!.collection(COLLECTION_NAME);
    poola = db!.collection(poolaCollection);
    // var liveMatch = await collection.find().toList();
    // var poolateams = await poolacollection.find().toList();
    // live_match.clear();
    // scorePoolA.clear();
    // live_match.addAll(liveMatch);
    // scorePoolA.addAll(poolateams);
  }

  static Future<void> addLive() async {
    try {
      await connect();
      var liveMatch = await match!.find().toList();
      live_match.clear();
      live_match.addAll(liveMatch);
    } catch (e) {
      log('Error in addLive: $e');
      rethrow;
    }
  }

  static Future<void> pool() async {
    try {
      await connect();
      var selector = where.sortBy('point', descending: true);
      var matches = await poola!.find(selector).toList();
      scorePoolA.clear();
      scorePoolA.addAll(matches);
    } catch (e) {
      log('Error in addLive: $e');
      rethrow;
    }
  }

  static Future<void> completedMatch() async {
    try {
      await connect();
      var firstDoc = await match!.findOne();
      if (firstDoc != null) {
        int scA = int.parse(firstDoc['ScoreA']);
        int scB = int.parse(firstDoc['ScoreB']);
        String teamA = firstDoc['teamA'];
        String teamB = firstDoc['teamB'];
        await poola?.update(
            where.eq('name', teamA), modify.inc("MatchCount", 1));
        await poola?.update(
            where.eq('name', teamB), modify.inc("MatchCount", 1));
        if (firstDoc['pool'] == "A") {
          if (scA > scB) {
            await poola?.update(where.eq('name', teamA), modify.inc("Won", 1));
            await poola?.update(
                where.eq('name', teamA), modify.inc("point", 2));
            await poola?.update(where.eq('name', teamB), modify.inc("loss", 1));
          } else if (scA < scB) {
            await poola?.update(where.eq('name', teamB), modify.inc("Won", 1));
            await poola?.update(
                where.eq('name', teamB), modify.inc("point", 2));
            await poola?.update(where.eq('name', teamA), modify.inc("loss", 1));
          } else if (scA == scB) {
            await poola?.update(where.eq('name', teamB), modify.inc("Draw", 1));
            await poola?.update(where.eq('name', teamA), modify.inc("Draw", 1));
            await poola?.update(
                where.eq('name', teamB), modify.inc("point", 1));
            await poola?.update(
                where.eq('name', teamA), modify.inc("point", 1));
          }
        }
        await match!.remove(where.id(firstDoc['_id']));
      } else {
        print("no collection");
      }
    } catch (e) {
      log('Error in addLive: $e');
      rethrow;
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }
}
