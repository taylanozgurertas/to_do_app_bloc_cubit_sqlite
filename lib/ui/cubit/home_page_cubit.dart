import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/data/entity/todo.dart';
import 'package:todoappsqlite/data/repo/todo_dao_repository.dart';

class HomePageCubit extends Cubit<List<ToDo>> {
  HomePageCubit() : super(<ToDo>[]);

  var krepo = ToDoDaoRepository();

  Future<void> loadToDos() async {
    var toDoList = await krepo.loadToDos();
    emit(toDoList);
  }

  Future<void> search(String searchingWord) async {
    var list = await krepo.search(searchingWord);
    emit(list);
  }

  Future<void> delete(int id) async {
    krepo.delete(id);
    loadToDos();
  }
}
