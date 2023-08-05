import 'package:film_explorer/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/title_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film explorer',
      home: BlocProvider(
        create: (context) => TitleBloc(),
        child: const HomePage(),
      ),
    );
  }
}
