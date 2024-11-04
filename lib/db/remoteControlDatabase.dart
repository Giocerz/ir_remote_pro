import 'package:ir_remote_pro/db/remoteControlModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RemoteControlDB {
  static const String tableName = "remoteControls";

  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'remoteControlDB'),
      onCreate: (db, version) {
        return db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        brand TEXT,
        category TEXT,
        powerBtn BLOB,
        exitBtn BLOB,
        menuBtn BLOB,
        upBtn BLOB,
        leftBtn BLOB,
        okBtn BLOB,
        rightBtn BLOB,
        downBtn BLOB,
        channelUpBtn BLOB,
        channelDownBtn BLOB,
        volumeUpBtn BLOB,
        volumeDownBtn BLOB,
        tvAvBtn BLOB,
        muteBtn BLOB
      )
      ''');
      },
      version: 1,
    );
  }

  static Future<int> insertBasic(
      RemoteControlParams remoteControlParams) async {
    Database database = await _openDB();
    final id = await database.insert(tableName, remoteControlParams.toMap());
    await database.close();
    return id;
  }
}
