import 'package:flutter/material.dart';
import 'create_game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> games = [];

  void _addGame(String gameName) {
    setState(() {
      games.add(gameName);
    });
  }

  void _goToCreateGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateGameScreen(onCreate: _addGame),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos Disponíveis'),
      ),
      body: games.isEmpty
          ? const Center(
              child: Text('Nenhum jogo disponível ainda'),
            )
          : ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(games[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCreateGame,
        child: const Icon(Icons.add),
      ),
    );
  }
}