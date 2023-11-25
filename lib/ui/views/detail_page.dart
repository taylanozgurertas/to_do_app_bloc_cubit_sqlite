import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/data/entity/todo.dart';
import 'package:todoappsqlite/ui/cubit/detail_page_cubit.dart';

class DetailPage extends StatefulWidget {
  ToDo item;

  DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var text = TextEditingController();

  @override
  void initState() {
    super.initState();
    text.text = widget.item.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: text,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(),
                    maxLines: null,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<DetailPageCubit>().update(widget.item.id, text.text);
                        Navigator.pop(context);
                      },
                      child: const Text("Update To Do"))
                ],
              )),
        ));
  }
}
