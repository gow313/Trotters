import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:trotters/constant.dart';

List live_match = [];
List scorePoolA = [];
List scorePoolB = [];
List admincredit = [];

class MongoDatabase {
  static Db? db;
  static DbCollection? match = db!.collection(COLLECTION_NAME);
  static DbCollection? poola = db!.collection(poolaCollection);
  static DbCollection? poolb = db!.collection(poolbCollection);
  static DbCollection? admin = db!.collection(adminLog);

  static Future<void> connect() async {
    db = await Db.create(MONGO_URL);
    await db!.open();
    inspect(db);
  }

  static Future<void> adminLogin() async {
    try {
      await connect();
      var credentials = await admin!.find().toList();
      admincredit.addAll(credentials);
    } catch (e) {
      rethrow;
    }
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
      var matchesA = await poola!.find(selector).toList();
      var matchesB = await poolb!.find(selector).toList();
      scorePoolA.clear();
      scorePoolB.clear();
      scorePoolA.addAll(matchesA);
      scorePoolB.addAll(matchesB);
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
          await poola?.update(
              where.eq('name', teamA), modify.inc("MatchCount", 1));
          await poola?.update(
              where.eq('name', teamB), modify.inc("MatchCount", 1));
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
        } else {
          await poolb?.update(
              where.eq('name', teamA), modify.inc("MatchCount", 1));
          await poolb?.update(
              where.eq('name', teamB), modify.inc("MatchCount", 1));
          if (scA > scB) {
            await poolb?.update(where.eq('name', teamA), modify.inc("Won", 1));
            await poolb?.update(
                where.eq('name', teamA), modify.inc("point", 2));
            await poolb?.update(where.eq('name', teamB), modify.inc("loss", 1));
          } else if (scA < scB) {
            await poolb?.update(where.eq('name', teamB), modify.inc("Won", 1));
            await poolb?.update(
                where.eq('name', teamB), modify.inc("point", 2));
            await poolb?.update(where.eq('name', teamA), modify.inc("loss", 1));
          } else if (scA == scB) {
            await poolb?.update(where.eq('name', teamB), modify.inc("Draw", 1));
            await poolb?.update(where.eq('name', teamA), modify.inc("Draw", 1));
            await poolb?.update(
                where.eq('name', teamB), modify.inc("point", 1));
            await poolb?.update(
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
