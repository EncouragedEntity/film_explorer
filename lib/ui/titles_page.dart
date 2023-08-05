import 'package:film_explorer/ui/titles_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/title_bloc.dart';
import '../bloc/title_event.dart';

int currentPageNum = 1;

class TitlesScreen extends StatefulWidget {
  const TitlesScreen({super.key});

  @override
  State<TitlesScreen> createState() => _TitlesScreenState();
}

class _TitlesScreenState extends State<TitlesScreen> {
  late TextEditingController _pageController;

  @override
  void initState() {
    _pageController = TextEditingController(text: currentPageNum.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film explorer'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: TitlesBlocBuilder(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[350],
            ),
            child: SizedBox(
              height: 70,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        if (_pageController.text.isEmpty) {
                          return;
                        }
                        currentPageNum = int.parse(_pageController.text);
                        if (currentPageNum != 1) {
                          currentPageNum--;
                          _pageController.text = currentPageNum.toString();
                        } else {
                          return;
                        }
                        context
                            .read<TitleBloc>()
                            .add(PreviousPageEvent(currentPageNum));
                      },
                      icon: const Icon(Icons.chevron_left),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        onChanged: (source) {
                          if (source.isNotEmpty) {
                            var number = int.parse(source);
                            if (number > 50) {
                              _pageController.text = 50.toString();
                            }
                            if (number < 1) {
                              _pageController.text = 1.toString();
                            }
                          }
                        },
                        onEditingComplete: () {
                          if (_pageController.text.isEmpty) {
                            return;
                          }
                          currentPageNum = int.parse(_pageController.text);
                          context
                              .read<TitleBloc>()
                              .add(GotoPageEvent(currentPageNum));
                        },
                        controller: _pageController,
                        textAlign: TextAlign.center,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          counterText: '',
                        ),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        if (_pageController.text.isEmpty) {
                          return;
                        }
                        currentPageNum = int.parse(_pageController.text);
                        if (currentPageNum != 50) {
                          currentPageNum++;
                          setState(() {
                            _pageController.text = currentPageNum.toString();
                          });
                        } else {
                          return;
                        }
                        context
                            .read<TitleBloc>()
                            .add(NextPageEvent(currentPageNum));
                      },
                      icon: const Icon(Icons.chevron_right),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
