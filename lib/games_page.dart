import 'package:flutter/material.dart';
import 'package:teammate/models/game.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  List<Game> games = [];
  var isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? const LoadingWidget()
            : ListView.builder(
                itemCount: games.length,
                itemBuilder: (_, index) => _GameTile(game: games[index]),
              ));
  }
}

class _GameTile extends StatelessWidget {
  const _GameTile({required this.game});
  final Game game;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(game.dateTime.toString()),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
