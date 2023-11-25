import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoappsqlite/ui/cubit/add_page_cubit.dart';
import 'package:todoappsqlite/ui/cubit/detail_page_cubit.dart';
import 'package:todoappsqlite/ui/cubit/home_page_cubit.dart';
import 'package:todoappsqlite/ui/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        ),
        BlocProvider(
          create: (context) => DetailPageCubit(),
        ),
        BlocProvider(
          create: (context) => AddPageCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'To Do App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 150, 114, 114)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
