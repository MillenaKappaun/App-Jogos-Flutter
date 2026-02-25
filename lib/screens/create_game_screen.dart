import 'package:flutter/material.dart';

class CreateGameScreen extends StatefulWidget {
  final Function(String) onCreate;

  const CreateGameScreen({super.key, required this.onCreate});

  @override
  State<CreateGameScreen> createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  final TextEditingController _gameController = TextEditingController();

  void _createGame() {
    if (_gameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite o nome do jogo')),
      );
    } else {
      widget.onCreate(_gameController.text);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Jogo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _gameController,
              decoration: const InputDecoration(
                labelText: 'Nome do jogo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createGame,
              child: const Text('Criar'),
            ),
          ],
        ),
      ),
    );
  }
}