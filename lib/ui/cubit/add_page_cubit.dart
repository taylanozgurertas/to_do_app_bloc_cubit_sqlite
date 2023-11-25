import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/data/repo/todo_dao_repository.dart';

class AddPageCubit extends Cubit<void> {
  AddPageCubit() : super(0);
  var krepo = ToDoDaoRepository();

  Future<void> save(String text) async {
    await krepo.kaydet(text);
  }
}
