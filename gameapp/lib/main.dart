import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcome to flutter',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    /*final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);*/
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starup Name Generator'),
      ),
      body: _buildSuggestion(),
    );
  }

  @override
  // TODO: implement widget
  Widget _buildSuggestion() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _builRow(_suggestions[index]);
        });
  }

  Widget _builRow(WordPair suggestion) {
    return ListTile(
      title: Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
