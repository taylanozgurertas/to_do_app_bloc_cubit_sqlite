import 'package:todoappsqlite/data/entity/todo.dart';
import 'package:todoappsqlite/sqlite/database_helper.dart';

class ToDoDaoRepository {
  Future<List<ToDo>> loadToDos() async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String, dynamic>> lines = await db.rawQuery("SELECT * FROM toDos");
    return List.generate(lines.length, (index) {
      var line = lines[index];
      var todo_id = line["id"];
      var todo_text = line["name"];
      return ToDo(id: todo_id, text: todo_text);
    });
  }

  Future<void> delete(int id) async {
    var db = await DatabaseHelper.databaseAccess();
    await db.delete("toDos", where: "id = ?", whereArgs: [id]);
  }

  Future<void> update(int id, String text) async {
    var db = await DatabaseHelper.databaseAccess();
    var updatedItem = Map<String, dynamic>();
    updatedItem["name"] = text;
    await db.update("toDos", updatedItem, where: "id = ?", whereArgs: [id]);
  }

  Future<void> kaydet(String text) async {
    var db = await DatabaseHelper.databaseAccess();
    var savedItem = Map<String, dynamic>();
    savedItem["name"] = text;

    await db.insert("toDos", savedItem);
  }

  Future<List<ToDo>> search(String searchingWord) async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String, dynamic>> lines = await db.rawQuery("SELECT * FROM toDos WHERE name like '%$searchingWord%'");
    return List.generate(lines.length, (index) {
      var line = lines[index];
      var id = line["id"];
      var text = line["name"];
      return ToDo(id: id, text: text);
    });
  }
}
