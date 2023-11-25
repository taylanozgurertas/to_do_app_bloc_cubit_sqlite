import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/ui/cubit/add_page_cubit.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add To Do"),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: text,
                    decoration: const InputDecoration(hintText: "write here what do you want to do?..."),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AddPageCubit>().save(text.text);
                        Navigator.pop(context);
                      },
                      child: const Text("Add To Do"))
                ],
              )),
        ));
  }
}
