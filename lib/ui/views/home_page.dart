import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/data/entity/todo.dart';
import 'package:todoappsqlite/ui/cubit/home_page_cubit.dart';
import 'package:todoappsqlite/ui/views/add_page.dart';
import 'package:todoappsqlite/ui/views/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchingNow = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().loadToDos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchingNow
            ? TextField(
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: (searchResult) {
                  context.read<HomePageCubit>().search(searchResult);
                },
              )
            : const Text('To Do List'),
        actions: [
          searchingNow
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searchingNow = false;
                    });
                    context.read<HomePageCubit>().loadToDos();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {
                    setState(() {
                      searchingNow = true;
                    });
                  },
                )
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<ToDo>>(
        builder: (context, todoListesi) {
          if (todoListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: todoListesi.length,
              itemBuilder: (context, index) {
                var todo_item = todoListesi[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(item: todo_item),
                          )).then((value) {
                        context.read<HomePageCubit>().loadToDos();
                      });
                    },
                    child: Dismissible(
                      key: ValueKey(todo_item.id),
                      onDismissed: (direction) {
                        context.read<HomePageCubit>().delete(todo_item.id);
                      },
                      child: Card(
                          child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(todo_item.text, style: Theme.of(context).textTheme.bodyLarge),
                          )),
                          const Icon(Icons.arrow_back_ios)
                        ],
                      )),
                    ));
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPage(),
              )).then((value) {
            context.read<HomePageCubit>().loadToDos();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
