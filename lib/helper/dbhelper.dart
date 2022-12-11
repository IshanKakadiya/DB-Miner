// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:animal_biograpy_app/model/api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  final String dbName = "animal.db";
  final String tableName = "animal";
  final String colID = "id";
  final String colname = "name";
  final String colorder = "order";
  final String colfamily = "family";
  final String collocations = "locations";
  final String colname_of_young = "name_of_young";
  final String colgroup_behavior = "group_behavior";
  final String colestimated_population_size = "estimated_population_size";
  final String colbiggest_threat = "biggest_threat";
  final String colmost_distinctive_feature = "most_distinctive_feature";
  final String colhabitat = "habitat";
  final String colcommon_name = "common_name";
  final String colskin_type = "skin_type";
  final String colcolor = "color";
  final String coltop_speed = "top_speed";
  final String colweight = "weight";
  final String colheight = "height";
  final String colage_of_sexual_maturity = "age_of_sexual_maturity";

  Database? db;

  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      String query =
          "CREATE TABLE IF NOT EXISTS subscriptionPlans($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT, $colorder TEXT, $colfamily TEXT,$colfamily TEXT,$collocations TEXT,$colname_of_young TEXT,$colgroup_behavior TEXT,$colestimated_population_size TEXT,$colbiggest_threat TEXT,$colmost_distinctive_feature TEXT,$colhabitat TEXT,$colcommon_name TEXT,$colskin_type TEXT,$colcolor TEXT,$coltop_speed TEXT,$colweight TEXT,$colheight TEXT,$colage_of_sexual_maturity TEXT)";
      await db.execute(query);
    });
  }

  Future<int?> insertRecord({required AnimalAndImages data}) async {
    await initDB();

    String query =
        "INSERT INTO subscriptionPlans($colname ,$colorder ,$colfamily ,$collocations ,$colname_of_young ,$colgroup_behavior ,$colestimated_population_size ,$colbiggest_threat ,$colmost_distinctive_feature ,$colhabitat ,$colcommon_name ,$colskin_type ,$colcolor ,$coltop_speed ,$colweight ,$colheight ,$colage_of_sexual_maturity) VALUES(?, ?, ? ,?, ?, ? ,?, ?, ? ,?, ?, ? ,?, ?, ? ,?, ?,);";
    List args = [
      data.name,
      data.order,
      data.family,
      data.locations,
      data.name_of_young,
      data.group_behavior,
      data.estimated_population_size,
      data.biggest_threat,
      data.most_distinctive_feature,
      data.habitat,
      data.common_name,
      data.skin_type,
      data.color,
      data.top_speed,
      data.weight,
      data.height,
      data.age_of_sexual_maturity,
    ];

    int? id = await db?.rawInsert(query, args);

    return id;
  }
}
