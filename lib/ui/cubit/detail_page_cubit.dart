import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/data/repo/todo_dao_repository.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);

  var krepo = ToDoDaoRepository();

  Future<void> update(int id, String text) async {
    await krepo.update(id, text);
  }
}
